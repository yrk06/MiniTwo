//
//  FinalFome.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 11/09/23.
//

import SwiftUI

struct FinalRuim: View {
    
    var imageName : String = "EndingHunger"
    var text : String = "Você deixou de comer por tempo demais.\n\nFatos desconhecidos: você é um ser humano que precisa se alimentar!"
    
    var body: some View {
        VStack (spacing: 50) {
            Image(imageName)
                .padding()
            VStack (spacing: 30) {
                Image("YouLose")
                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .center)
            }
            Button {
                
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
                Color("OrangeFood")
                Image("Perdeu")
                    .opacity(0.5)
            }
        }
        .ignoresSafeArea()
    }
}
