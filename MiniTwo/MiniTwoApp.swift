//
//  MiniTwoApp.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 25/08/23.
//

import SwiftUI

@main
struct MiniTwoApp: App {
    
    var objMan : ObjectiveManager = ObjectiveManager()
    var notificationQueue: NotificationQueue = NotificationQueue()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(objMan)
                .environmentObject(notificationQueue)
                .notificationPresenter(notificationQueue: notificationQueue)
        }
    }
}
