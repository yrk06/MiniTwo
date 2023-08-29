//
//  ARTestts.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

struct Bank : View {
    @State var h = false
    @State var w = false
    
    var type = Int8.random(in: 1...3)
    
    var body: some View {
        ZStack {
            Text("Welcome to Placeholder Bank App")
            
            switch type {
            case 1:
                PopUp(headline: "Você merece!", op_1: $h, op_2: $w)
            case 2:
                PopUp(headline: "Chega de pepinos!", op_1: $h, op_2: $w)
            case 3:
                PopUp(headline: "Realize seu sonho agora mesmo!", op_1: $h, op_2: $w)
            default:
                Text("No pop up :(")
            }
        }
    }
}


