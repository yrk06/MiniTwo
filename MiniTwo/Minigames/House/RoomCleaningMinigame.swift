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
        SpriteView(scene: RoomCleaning(completeHandler: {
            objMan.complete_mission(type: .limpar)
            stsMan.changeHealth(by: 10)
//            dismiss()
            NavigationUtil.popToRootView()
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
