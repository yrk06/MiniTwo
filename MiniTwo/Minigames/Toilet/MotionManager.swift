//
//  MotionManager.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import Foundation
import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {
    
    let motionManager = CMMotionManager()
    
    var state: Binding<Int>
    var stateLock: Bool = false
    
    func configure(state: Binding<Int>) {
        self.state = state
        motionManager.startDeviceMotionUpdates(to: .main, withHandler: self.handleAccelerometerUpdates)
        print("config")
    }
    
    init() {
        state = Binding(get: { return 0 }, set: { _ in })
        print("init")
    }
    
    func finish() {
        motionManager.stopDeviceMotionUpdates()
        print("finish")
    }
    
    func handleAccelerometerUpdates(_ motion: CMDeviceMotion?, _ error: Error?) {
        if let motion = motion {
            // Get user acceleration and gravity data
            let userAcceleration = motion.userAcceleration
            // Update publishers with the new sensor data
            
            if !stateLock {
                if state.wrappedValue % 2 == 0 {
                    if userAcceleration.y > 1.2 {
                        state.wrappedValue += 1
                        stateLock = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.stateLock = false
                        }
                    }
                } else {
                    if userAcceleration.y < -1.2 {
                        state.wrappedValue += 1
                        stateLock = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.stateLock = false
                        }
                    }
                }
            }
            
        }
    }
}
