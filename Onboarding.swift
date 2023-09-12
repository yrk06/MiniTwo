//
//  Onboarding.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 11/09/23.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        
        ZStack{
            Color("OrangeFood")
                .edgesIgnoringSafeArea(.all)
            
            Image("bankCardModel")
                .opacity(0.2)
                .padding(.top, -500)
                .padding(.leading, -210)
            
            Image("barcodeModel2")
                .opacity(0.2)
                .padding(.top, -540)
                .padding(.leading, 280)
            
            Image("notification1")
//                .opacity(0.2)
                .padding(.top, -295)
                .padding(.leading, 430)
            
            Image("panelaFrame")
                .opacity(0.2)
                .padding(.top, 650)
                .padding(.leading, -345)
            
            Image("cupomFrame")
                .opacity(0.2)
                .padding(.top, 633)
                .padding(.leading, 405)
            
            
            VStack {
                Text("Boas vindas à vida adulta!")
                    .fontBob(size: 28)
                    .lineSpacing(16)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 140)
                    .padding(.vertical)
                
                
                Text("Ninguém falou que ia ser fácil, mas também não disse que ia ser tão difícil. \n\nSeu objetivo aqui é sobreviver a uma semana resolvendo pepinos típicos dessa nova fase da vida.")
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 240)
                    .padding(.vertical)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 300, height: 50)
                    
                    Text("Continuar")
                        .foregroundColor(Color("OrangeFood"))
                        .bold()
    
                }
                .padding(20)
                
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
