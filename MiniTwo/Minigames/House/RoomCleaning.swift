//
//  RoomCleaning.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import Foundation
import SpriteKit

class RoomCleaning: SKScene {
    
    var crop: SKCropNode!
    let cellSize: Int = 120
    
    let completeTask: (()->Void)
    
    init(completeHandler: @escaping (()->Void)) {
        completeTask = completeHandler
        super.init(size: CGSize(width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var cells: [[Bool]] = []
    
    private var side: CGFloat = 0
    
    override func didMove(to view: SKView) {
        crop = SKCropNode()
        crop.maskNode = SKSpriteNode()
        
    
        side = min(view.window!.screen.bounds.width, view.window!.screen.bounds.height)
        
        size = CGSize(width: side, height: side)
        
        let lines = ceil(side / CGFloat(cellSize))
        let columns = ceil(side / CGFloat(cellSize))
        
        print("Lines: \(lines); Columns: \(columns)")
        
        for _ in 0..<Int(lines) {
            var completed: [Bool] = []
            for _ in 0..<Int(columns) {
                completed.append(false)
            }
            cells.append(completed)
        }
        
        print(side)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let herrmann = SKSpriteNode(color: .systemPink, size: CGSize(width: side, height: side))//SKSpriteNode(imageNamed: "PictureHerrmann")
        herrmann.size = CGSize(width: side, height: side)
        addChild(herrmann)
        addChild(crop)
        let tomb = SKSpriteNode(color: .cyan, size: CGSize(width: side, height: side))//SKSpriteNode(imageNamed: "PictureTombstone")
        tomb.size = CGSize(width: side, height: side)
        crop.addChild(tomb)
        self.size = CGSize(width: side, height: side)
    }
    
    func touchMoved(toPoint pos : CGPoint) {

        let circle: SKShapeNode = SKShapeNode(circleOfRadius: CGFloat(cellSize)/2)
        circle.fillColor = UIColor(white: 1, alpha: 0.8)
        circle.position = pos
        crop.maskNode!.addChild(circle)
        
        
        let x = Int(floor((pos.x + side / 2) / CGFloat(cellSize)))
        let y = Int(floor((pos.y + side / 2) / CGFloat(cellSize)))
        
        if x < 0 || x >= cells.count || y < 0 || y >= cells.count {
            return
        }
        
        cells[y][x] = true
        
        var count = 0
        var total = 0
        
        for i in cells {
            for j in i {
                total += 1
                if j {
                    count += 1
                }
            }
        }
        
        print(count)
        print(total)
        
        let pctg = Float(count)/Float(total) * 100
        print("cells \(pctg)%")
        
        if pctg >= 80 {
            completeTask()
        }
        //print("X: \(pos.x), X1: \(x) Y: \(pos.y)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
}
