//
//  Home.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var game : GameManager
    
    var body: some View {
        NavigationStack() {
            VStack {
                if game.dayTransition {
                    Text("Você está dormindo")
                }
                Text("\(game.dayTick)")
                Text("Day: \(game.day)")
                ObjectiveView()
                
                if !game.dayTransition {
                    NavigationLink("iFood") {
                        iFood()
                    }
                    NavigationLink("Bank") {
                        Bank()
                    }
                    NavigationLink("Home") {
                        House()
                    }
                }
                
            }
            
        }
        .onChange(of: game.dayTransition, perform: {
            v in
            if v {
                NavigationUtil.popToRootView()
            }
        })
    }
}


struct Home_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let gameManager : GameManager = GameManager()
        let notificationQueue: NotificationQueue = NotificationQueue()
        
        Home()
            .environmentObject(gameManager)
            .environmentObject(gameManager.objectiveManager)
            .environmentObject(notificationQueue)
            .notificationPresenter(notificationQueue: notificationQueue, gameManager: gameManager)
            .onAppear {
                gameManager.startDay()
            }
            .statusBar(hidden: true)
    }
}
