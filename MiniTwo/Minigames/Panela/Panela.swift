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
    @EnvironmentObject var gameManager: GameManager
    @Environment(\.dismiss) var dismiss
    
    @State var angle : Double = 1
    @State var points : Int = 0
    
    
    var body: some View {
        ZStack {
            VStack {
//                Text("\(angle)")
//                    .foregroundColor(angle >= -50 && angle <= 50 ? .green : .black)
                
                Image("panela")
                    .offset(x: 0, y: 100)
                    .zIndex(1)
                Image("fogao")
            }
            .offset(x: 0, y: -96)
            
            ZStack {
                Text("\("🔥" * (3-points))")
                    .font(.system(size: 64))
                    .offset(x: 0, y: -100)
                Image("gauge")
                Image("pointer")
                    .offset(x: 0, y: -15)
                    .Oscilate($angle)
                    .offset(x: 0, y: 30)
            }
            .offset(x: 0,y: 200 - 96)
            Button {
                if (angle >= -50 && angle <= 50)
                {
                    points += 1
                    if (points >= 3) {
                        objMan.complete_mission(type: .comer)
                        stsMan.changeHunger(by: 30)
                        stsMan.changeHealth(by: 30)
//                        dismiss()
                        NavigationUtil.popToRootView()
                    }
                } else {
                    stsMan.changeHealth(by: -5)
                }

            } label: {
                Text("Tirar panela do fogo")
                    .font(.callout)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(.green)
                    .cornerRadius(14)
                    .Boom()
            }.offset(x: 0, y: -96)
            
            
        }
        .offset(x: 0, y: 20)
        .TextBackground(palavra: "Panela", count: 10)
        .background(Color("GrayBackItems"))
        .firstTimeAlert(idx: 0, title: "A panela vai explodir", message: "Toque no botão quando a seta estiver no verde para tirar a panela do fogo", gameManager: gameManager)
    }
}

struct Panela_Previews: PreviewProvider {
    static var previews: some View {
        Panela()
            .environmentObject(GameManager())
    }
}
