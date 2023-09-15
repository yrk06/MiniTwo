//
//  FinalBom.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 12/09/23.
//

import SwiftUI

struct FinalBom: View {
    
    @EnvironmentObject var sndMan : SoundManager
    @EnvironmentObject var game : GameManager
    @EnvironmentObject var notification : NotificationQueue
    
    var body: some View {
        VStack (spacing: 50) {
            Image("Win")
                .padding()
            VStack (spacing: 30) {
                Image("YouWin")
                Text("Você sobreviveu a uma semana completa. UAU!\n\nParabéns, aqui está a sua medalha de adulto!")
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .center)
            }
            Button {
                game.restartGame()
                notification.canPush = true
            } label: {
                Text("Jogar de novo")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .cornerRadius(200)
            }
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            ZStack {
                Color("WinBlue")
                Image("Venceu")
                    .opacity(0.5)
            }
        }
        .ignoresSafeArea()
        .transition(.scale)
        .onAppear {
            notification.stopNotificationTimer()
            sndMan.playSound("vitória.wav", loops: 0)
        }
    }
}
