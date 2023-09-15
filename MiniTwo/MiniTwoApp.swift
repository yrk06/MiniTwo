//
//  MiniTwoApp.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 25/08/23.
//

import SwiftUI

@main
struct MiniTwoApp: App {
    
    var gameManager : GameManager = GameManager()
    var soundManager : SoundManager = SoundManager()
    var notificationQueue: NotificationQueue = NotificationQueue()
    
    @State var scene = 0
    
    var body: some Scene {
        WindowGroup {
            Group {
                
                
                switch scene {
                case 0:
                    Onboarding(screen: $scene)
                        .transition(.move(edge: .top))
                case 1:
                    OnboardingFinal(screen: $scene)
                        .transition(.move(edge: .bottom))
                default:
                    ZStack {
                        Home()
                            .environmentObject(gameManager)
                            .environmentObject(gameManager.objectiveManager)
                            .environmentObject(gameManager.statusManager)
                            .environmentObject(notificationQueue)
                            .environmentObject(soundManager)
                            .notificationPresenter(notificationQueue: notificationQueue, gameManager: gameManager)
                            .onAppear {
                                gameManager.startDay()
                                notificationQueue.startNotificationTimer()
                            }
                            .statusBar(hidden: true)
                            .preferredColorScheme(.light)
                    }
                }
            }.animation(.easeInOut(duration: 1), value: scene)
            
        }
    }
}
