//
//  HapticEngine.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 29/08/23.
//

import Foundation
import CoreHaptics

class HapticsManager {
    static let shared = HapticsManager()
    
    var engine: CHHapticEngine? = nil
    
    
    private init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
        
        do {
            engine = try CHHapticEngine()
        } catch let error {
            print("Engine Creation Error: \(error.localizedDescription)")
        }
        
        guard let engine = engine else {return}
        
        engine.resetHandler = {
            
            print("Reset Handler: Restarting the engine.")
            
            do {
                // Try restarting the engine.
                try self.engine?.start()
                        
                // Register any custom resources you had registered, using registerAudioResource.
                // Recreate all haptic pattern players you had created, using createPlayer.


            } catch {
                fatalError("Failed to restart the engine: \(error)")
            }
        }
        
        engine.stoppedHandler = { reason in
            print("Stop Handler: The engine stopped for reason: \(reason.rawValue)")
            switch reason {
            case .audioSessionInterrupt: print("Audio session interrupt")
            case .applicationSuspended: print("Application suspended")
            case .idleTimeout: print("Idle timeout")
            case .systemError: print("System error")
            default:
                print("Unknown error")
            }
        }
        do {
            try engine.start()
        } catch {
            print("\(error.localizedDescription)")
        }
        
    }
}
