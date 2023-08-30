//
//  iFood.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 29/08/23.
//

import SwiftUI

struct iFood: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    
    var body: some View {
        ZStack {
            ObjectiveView()

            ForEach(Range(1...10), id: \.self) { i in
                let off : CGFloat = CGFloat(i)/10
                FPopUp(text: phrases["Você merece!"]!, time_to_appear: .now() + off)
            }
        }
        .onAppear {
            objMan.fill_objectives(n: 5)
        }
    }
}
