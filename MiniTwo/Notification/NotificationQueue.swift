//
//  NotificationQueue.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 27/08/23.
//

import Foundation

class NotificationQueue: ObservableObject {
    
    @Published var queue: [any Notification] = []
    @Published var current: any Notification = EmptyNotification()
    
    func addCurrent(_ notification: any Notification) {
        current = notification
        if current.timeToDismiss > 0 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + UInt64(Int64(current.timeToDismiss) * Int64(1e9)) ) )
            {
                self.dismissCurrent()
            }
        } else {
            current.dismiss = self.dismissCurrent
        }
        
    }
    
    func dismissCurrent() {
        current.dismissed = true
        if queue.count > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addCurrent(self.queue.removeFirst())
            }
        }
        
        
    }
    
    func push(_ notification: any Notification) {
        if queue.count == 0 && current.dismissed {
            addCurrent(notification)
        } else {
            queue.append(notification)
        }
        
    }
    
}
