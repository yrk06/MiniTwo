//
//  Font.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 06/09/23.
//

import Foundation
import SwiftUI

extension View {
    func fontBob(size: CGFloat) -> some View {
        return self.font(.custom("MyFontRegular", size: size))
    }
    
    func firstTimeAlert(idx: Int, title: String, message: String, gameManager: GameManager) -> some View {
        return self.alert(isPresented: gameManager.firstTime(idx)) {
            Alert(
                title: Text(title),
                message: Text(message),
                dismissButton: .default(Text("OK")) {
                    gameManager.firstTime(idx).wrappedValue = false
                }
            )
        }
    }
}
