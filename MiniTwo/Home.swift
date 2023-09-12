//
//  Home.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var game : GameManager
    @EnvironmentObject var stsMan : StatusManager
    @EnvironmentObject var notification : NotificationQueue
    
    var body: some View {
        if !game.gameEnded {
            ZStack {
                NavigationStack() {
                    if game.dayTransition {
                        BetweenDays(day: game.day, cont: {
                            game.startDay()
                        })
                        .transition(.opacity)
                    } else {
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
                }
                .animation(.easeInOut, value: game.dayTransition)
                .onChange(of: game.dayTransition, perform: {
                    v in
                    if v {
                        NavigationUtil.popToRootView()
                    }
                })
                VStack {
                    Spacer()
                    StatusBar()
                        .font(.largeTitle)
                }
            }
        }
        else {
            if game.gameWon {
                FinalBom()
            } else if stsMan.getHealth() <= 0 {
                FinalRuim(imageName: "EndingHealth")
            } else if stsMan.getMoney() <= 0 {
                FinalRuim(imageName: "EndingMoney")
            } else if stsMan.getHunger() <= 0 {
                FinalRuim(imageName: "EndingHunger")
            }
        }
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
