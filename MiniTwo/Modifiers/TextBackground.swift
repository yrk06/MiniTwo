//
//  TextBackground.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 06/09/23.
//

import Foundation
import SwiftUI

struct TextBackground: ViewModifier {
    
    let palavra: String
    let count: Int
    
    
    func body(content: Content) -> some View {
        
        ZStack {
            Text(palavra * count)
                .fontBob(size: 96)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(-1)
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
            content.zIndex(1)
        }
    }
    
}

extension View {
    func TextBackground(palavra: String, count: Int = 5) -> some View {
        modifier(MiniTwo.TextBackground(palavra: palavra, count: count))
    }
}

func *(left:String, right:Int) -> String {
     return String(repeating:left, count:right)
}
