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
    var notificationQueue: NotificationQueue = NotificationQueue()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(gameManager)
                .environmentObject(gameManager.objectiveManager)
                .environmentObject(notificationQueue)
                .notificationPresenter(notificationQueue: notificationQueue)
                .onAppear {
                    gameManager.startDay()
                }
        }
    }
}
