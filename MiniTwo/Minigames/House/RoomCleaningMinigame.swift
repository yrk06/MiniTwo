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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        SpriteView(scene: RoomCleaning(completeHandler: {
            objMan.complete_mission(type: .limpar)
            dismiss()
        }))
            .scaledToFit()
    }
}

struct RoomCleaningMinigame_Previews: PreviewProvider {
    static var previews: some View {
        RoomCleaningMinigame()
            .environmentObject(ObjectiveManager())
    }
}
