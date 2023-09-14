//
//  ToiletMinigame.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import SwiftUI

struct ToiletMinigame: View {
    @State var toiletState: Int = 0
    @StateObject var motionManager: MotionManager = .init()
    
    @EnvironmentObject var objectiveManager: ObjectiveManager
    @EnvironmentObject var stsMan: StatusManager
    @EnvironmentObject var gameManager: GameManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack (alignment: .center) {
            Image("ToiletFull")
                    .zIndex(0)
            
            Image("Desentupidor")
                .zIndex(1)
                .frame(alignment: .center)
            .offset(x:0, y: toiletState % 2 == 0 ? -20 : -100)
            .transition(.slide)
            .animation(.easeInOut(duration: 0.1), value: toiletState)
        }
        
        .overlay (
            Image("ToiletMask"),
            alignment: .bottom
        )
        .offset(x: 0, y: 130)
        .TextBackground(palavra: "Desentupir")
        .background(Color("GrayBackItems"))
        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    // up
                                    if toiletState % 2 == 0 {
                                        toiletState += 1
                                    }
                                }

                                if value.translation.height > 0 {
                                    if toiletState % 2 == 1 {
                                        toiletState += 1
                                    }
                                }
                            }))
        .onChange(of: toiletState, perform: {
            value in
            if value >= 10 {
                objectiveManager.complete_mission(type: .privada)
                stsMan.changeHealth(by: -10)
                print("Hello Im an Error")
                motionManager.finish()
//                dismiss()
                NavigationUtil.popToRootView()
            }
        })
        .onDisappear {
            motionManager.finish()
        }
        .firstTimeAlert(idx: 2, title: "Sua privada entupiu!", message: "Arraste o desentupidor para cima e para baixo para consertar sua privada.", gameManager: gameManager)
        
    }
}

struct ToiletMinigame_Previews: PreviewProvider {
    static var previews: some View {
        ToiletMinigame()
            .environmentObject(GameManager())
    }
}
