//
//  ARTestts.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

struct Bank : View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    
    @State var h = false
    @State var w = false
    
    var type = Int8.random(in: 1...3)
    
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome to Placeholder Bank App")
                Button {
                    objMan.complete_mission(type: .boleto)
                } label: {
                    Text("Pagar boleto")
                }
            }
            
            if !h && !w {
                switch type {
                case 1:
                    BPopUp(headline: "Você merece!", op_1: $h, op_2: $w)
                case 2:
                    BPopUp(headline: "Chega de pepinos!", op_1: $h, op_2: $w)
                case 3:
                    BPopUp(headline: "Realize seu sonho agora mesmo!", op_1: $h, op_2: $w)
                default:
                    Text("No pop up :(")
                }
            }
        }
    }
}


