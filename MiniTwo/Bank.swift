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
    
    var body: some View {
        PopUp(text: "I'm a PopUp!", op_1: $h, op_2: $w)
        Text("Welcome to Placeholder Bank App")
    }
}


