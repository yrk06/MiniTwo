//
//  RoomCleaningMinigame.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI
import SpriteKit

struct RoomCleaningMinigame: View {
    
    @EnvironmentObject var sndMan: SoundManager
    @EnvironmentObject var objMan: ObjectiveManager
    @EnvironmentObject var stsMan: StatusManager
    @EnvironmentObject var gameManager: GameManager
    @Environment(\.dismiss) var dismiss
    
    @State var canDispatch : Bool = true
    
    var body: some View {
        Group {
            SpriteView(scene: RoomCleaning(completeHandler: {
                if canDispatch {
                    objMan.complete_mission(type: .limpar)
                    stsMan.changeHealth(by: -15)
                    canDispatch = false
                }
                NavigationUtil.popToRootView()
                print("Error")
            }))
            .scaledToFit()
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .TextBackground(palavra: "Aspirador", count: 3)
        .background(Color("GrayBackItems"))
        .onAppear {
            canDispatch = true
            sndMan.playSound("limparCasa.wav", loops: 0)
        }
        .onDisappear {
            sndMan.stopSound()
        }
        .firstTimeAlert(idx: 1, title: "Sua casa está imunda!", message: "Arraste o dedo na tela para limpar e deixar sua casa habitável novamente.", gameManager: gameManager)
    }
}

struct RoomCleaningMinigame_Previews: PreviewProvider {
    static var previews: some View {
        RoomCleaningMinigame()
            .environmentObject(GameManager())
    }
}
