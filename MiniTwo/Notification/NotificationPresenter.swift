//
//  NotificationPresenter.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 28/08/23.
//

import SwiftUI

struct NotificationPresenter: ViewModifier {
    
    
    @ObservedObject var notificationQueue: NotificationQueue    
    
    
    var content: some View = EmptyView()
    
    func body(content: Content) -> some View {
        ZStack {
            
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
                
                
                
                let current = notificationQueue.current
                Group {
                    if !current.dismissed {
                        AnyView(current.getScreenView())
                            .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
                        
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .animation(.default, value: current.dismissed)
                .animation(.default, value: current.id)
                
                
        }.frame(maxHeight: .infinity)
    }
}

extension View {
    func notificationPresenter(notificationQueue: NotificationQueue) -> some View {
        modifier(NotificationPresenter(notificationQueue: notificationQueue))
    }
}

struct NotificationPresenter_Previews: PreviewProvider {
    
    static var previews: some View {
        let notificationQueue = NotificationQueue()
        VStack {
            Text("Hello World")
            Button("Call me maybe")
            {
                notificationQueue.push(CallNotification(caller: "MIM DE AUUUUUUUUUU"))
            }
        }
        .notificationPresenter(notificationQueue: notificationQueue)
    }
}
