//
//  Panela.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 05/09/23.
//

import SwiftUI

struct Panela: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @EnvironmentObject var stsMan : StatusManager
    @Environment(\.dismiss) var dismiss
    
    @State var angle : Double = 1
    @State var points : Int = 0
    
    var body: some View {
        VStack {
            Text("\(angle)")
            ZStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.green)
                    .offset(x: 0, y: -45)
                Image(systemName: "arrow.up")
                    .font(.largeTitle)
                    .offset(x: 0, y: -30)
                    .Oscilate($angle)
            }
            Button {
                if (angle >= -20 && angle <= 20)
                {
                    points += 1
                    if (points >= 3) {
                        objMan.complete_mission(type: .comer)
                        stsMan.changeHunger(by: 10)
                        stsMan.changeHealth(by: -10)
//                        dismiss()
                        NavigationUtil.popToRootView()
                    }
                } else {
                    stsMan.changeHealth(by: -5)
                }

            } label: {
                Text("Press me")
            }
            Text("\(points)")
        }
    }
}

struct Panela_Previews: PreviewProvider {
    static var previews: some View {
        Panela()
    }
}
