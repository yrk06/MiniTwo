//
//  ARController.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 29/08/23.
//
import ARKit
import UIKit
import SwiftUI

class ARController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    
    // The 3 main views used for the game
    var arView = ARSCNView(frame: .zero)
    
    var boletos = 0
    
    var dismiss: (() -> Void)?
    
    init(dismiss: (() -> Void)?) {
        
        self.dismiss = dismiss
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Create the main ARView for the board
    func createArView () {
        arView = ARSCNView(frame: .zero)
        self.view.addSubview(arView);
        arView.scene = SCNScene()
        arView.scene.rootNode.light = nil
        arView.delegate = self;
        arView.showsStatistics = true
        
        scaleView(arView)
        
        arView.contentMode = .scaleAspectFit
        arView.backgroundColor = .black
        
        startAR()
    }
    
    
    // VIEW SIZING
    
    // Make sure the frame sizes are all updated when the screen is rotated
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        scaleView(arView)
        
    }
    
    // Calculate the width and height based on an Ipad Pro Aspect ratio
    func scaleView(_ v : UIView) {
        let width = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height
        height -= view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 24
        v.frame = CGRect(x: 0, y: 0, width: width, height: height)
        v.contentMode = .scaleAspectFit
    }
    
    // STARTUP
    
    override func viewDidLoad() {
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createArView()
        scaleView(arView)
    }
    
    
    // This is called when ARKit finds a new anchor
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Place content only for anchors found by plane detection.
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        /* There is some logic to show a "start" button
         * this is done in order to let the player choose
         * which surface they want to place the board in.
         */
        //let url = Bundle.main.url(forResource: "BoardStart", withExtension: "scn" )!
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.1))  //SCNReferenceNode(url: url)!
        /*SCNTransaction.begin()
        sphere.load()
        SCNTransaction.commit()*/
        
        sphere.simdPosition = SIMD3<Float>(planeAnchor.center.x,0.05,planeAnchor.center.z)
        node.addChildNode(sphere)
        }
    
    
    var devicePosition: SCNVector3 = SCNVector3Zero
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
            // Get the position and orientation of the device in ARKit coordinates
            devicePosition.x = frame.camera.transform.columns.3.x
            devicePosition.y = frame.camera.transform.columns.3.y
            devicePosition.z = frame.camera.transform.columns.3.z
        }
    
    func distanceBetweenPoints(_ point1: SCNVector3, _ point2: SCNVector3) -> Float {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        let dz = point2.z - point1.z
        
        return sqrt(dx * dx + dy * dy + dz * dz)
    }
    
    // Detect when one of the possible locations was choosen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        guard let touchLocation = touches.first?.location(in: arView),
        let result = arView.hitTest(touchLocation, options: nil).first else {
                    return
        }
        let resultNode = result.node
        
        if distanceBetweenPoints(resultNode.position, devicePosition) > 0.3 {
            return
        }
        
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red
        resultNode.geometry?.materials = [redMaterial]
        resultNode.removeFromParentNode()
        boletos += 1
        
        if boletos == 1 {
            arView.session.pause()
            dismiss?()
        }
    }
    
    func startAR() {
        // Remove the old board
        arView.session.pause()
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Detect horizontal planes in the scene
        configuration.worldAlignment = .gravity
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        arView.session.delegate = self
        
        let scene = arView.scene
        
        let centerNode = SCNNode()
        scene.rootNode.addChildNode(centerNode)
        
        // Define the radius of the circle and the number of planes
        let circleRadius: Float = 0.3
        let numPlanes = 6
        
        for i in 0..<numPlanes {
            // Calculate the angle for each plane
            let angle = Float(i) * (Float.pi * 2.0) / Float(numPlanes)
            
            // Calculate the position of the plane in the circle
            let x = circleRadius * cos(angle)
            let z = circleRadius * sin(angle)
            
            // Create a plane geometry
            let plane = SCNPlane(width: 0.2, height: 0.2)
            
            let material = SCNMaterial()
            material.diffuse.contents = UIImage(named: "barcodeModel")
            plane.materials = [material]
            let planeNode = SCNNode(geometry: plane)
            
            // Position the plane in the circle and face the center
            planeNode.position = SCNVector3(x, 0, z)
            
            
            planeNode.eulerAngles = SCNVector3(0, (2 * SCNFloat.pi) - SCNFloat.pi / 2 - angle, 0)
            
            
            
            // Add the plane node to the scene
            centerNode.addChildNode(planeNode)
        }
    }
}


struct ARView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ARController
    
    @EnvironmentObject var objMan: ObjectiveManager
    @EnvironmentObject var stsMan: StatusManager
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> ARController {
        // Return MyViewController instance
        return ARController(dismiss: {
            objMan.complete_mission(type: .boleto)
            stsMan.changeMoney(by: -25)
            stsMan.changeHealth(by: -10)
            dismiss()
        })
    }
    
    func updateUIViewController(_ uiViewController: ARController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
