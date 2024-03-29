//
//  Home.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var sndMan : SoundManager
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
//                        .transition(.opacity)
                    } else {
                        ZStack {
                            VStack {
                                Spacer()
                                Image("BackgroundMain")
                                    .foregroundColor(Color("GrayBack"))
                                    
                            }
                            .ignoresSafeArea()
                            VStack {
                                Image("PepinoLogo")
                                    .padding()
                                
                                ObjectiveView()
                                
                                if !game.dayTransition {
                                    HStack (spacing: 20) {
                                        NavigationLink {
                                            iFood()
                                        } label: {
                                            VStack {
                                                Image("iPepinoIcon2")
                                                Text("iPepino")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                        NavigationLink {
                                            Bank()
                                        } label: {
                                            VStack {
                                                Image("PepinoBankIcon")
                                                Text("PepinoBank")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        
                                        NavigationLink {
                                            House()
                                        } label: {
                                            VStack {
                                                Image("PepinoHouseIcon")
                                                Text("PepinoHouse")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                }
                                Spacer()
                            }
                        }
                        .background(Color("GrayBackItems"))
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
                    if !game.dayTransition {
                        StatusBar()
                            .font(.largeTitle)
                    }
                }
            }
        }
        else {
            if game.gameWon {
                FinalBom()
            } else if stsMan.getHealth() <= 1 {
                FinalRuim(imageName: "EndingHealth", text: "Você negligenciou sua saúde por tempo demais.\n\nFatos desconhecidos: você é um organismo frágil que precisa de cuidados! ")
            } else if stsMan.getMoney() <= 1 {
                FinalRuim(imageName: "EndingMoney", text: "Seu saldo bancário está parecendo o deserto do Saara, só que mais seco.\n\nFatos desconhecidos: você é uma pessoa que precisa de dinheiro para sobreviver! ")
            } else if stsMan.getHunger() <= 1 {
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
