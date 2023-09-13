//
//  NotificationPresenter.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 28/08/23.
//

import SwiftUI

struct NotificationPresenter: ViewModifier {
    
    
    @ObservedObject var notificationQueue: NotificationQueue
    @ObservedObject var gameManager: GameManager
    
    
    func body(content: Content) -> some View {
        GeometryReader {
            proxy in
            
            ZStack (alignment: .top) {
                
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 16)
                    Text("\(Int(floor(Double(gameManager.dayTick / 60)))):" + String(format: "%02d",gameManager.dayTick % 60))
                        .font(.callout)
                        .bold()
                    Spacer()
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 16)
                    Text("\(gameManager.day + 1)/7")
                        .bold()
                }
                .frame(height: proxy.safeAreaInsets.top)
                .padding(.horizontal,36)
                .ignoresSafeArea()
                .zIndex(1)
                //.background(.ultraThinMaterial)
                    
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .zIndex(0)
                
                
                
                
                if notificationQueue.canPush {
                    let current = notificationQueue.current
                    Group {
                        if !current.dismissed {
                            AnyView(current.getScreenView())
                                .zIndex(2)
                                .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
                                .padding(.top,1)
                                .cornerRadius(16)
                                .padding(8)
                            
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .animation(.default, value: current.dismissed)
                    .animation(.default, value: current.id)
                }
                
            }.frame(maxHeight: .infinity)
        }
    }
}

extension View {
    func notificationPresenter(notificationQueue: NotificationQueue, gameManager: GameManager) -> some View {
        modifier(NotificationPresenter(notificationQueue: notificationQueue, gameManager: gameManager))
    }
}

struct NotificationPresenter_Previews: PreviewProvider {
    
    static var previews: some View {
        let notificationQueue = NotificationQueue()
        let gameManager = GameManager()
        VStack {
            Text("Hello World")
            Button("Call me maybe")
            {
                notificationQueue.push(CallNotification(caller: "MIM DE AUUUUUUUUUU"))
            }
        }
        .notificationPresenter(notificationQueue: notificationQueue, gameManager: gameManager)
    }
}
