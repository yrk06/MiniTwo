//
//  RoomCleaningMinigame.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI
import SpriteKit

struct RoomCleaningMinigame: View {
    
    @EnvironmentObject var objMan: ObjectiveManager
    @EnvironmentObject var stsMan: StatusManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Group {
            SpriteView(scene: RoomCleaning(completeHandler: {
                objMan.complete_mission(type: .limpar)
                stsMan.changeHealth(by: 10)
                NavigationUtil.popToRootView()
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
        
        
    }
}

struct RoomCleaningMinigame_Previews: PreviewProvider {
    static var previews: some View {
        RoomCleaningMinigame()
            .environmentObject(ObjectiveManager())
    }
}
