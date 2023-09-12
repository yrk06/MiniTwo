//
//  OnboardingFinal.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 11/09/23.
//

import SwiftUI

struct OnboardingFinal: View {
    var body: some View {
        ZStack{
            Color("Blue")
                .edgesIgnoringSafeArea(.all)
            
            Image("statsFrame")
                .opacity(0.2)
                .padding(.top, -470)
                .padding(.leading, -230)
        
            Image("PepinoBankFrame")
                .opacity(0.2)
                .padding(.top, -375)
                .padding(.leading, 300)
            
            Image("iPepinoFrame")
                .opacity(0.2)
                .padding(.top, 650)
                .padding(.leading, -275)
            
            Image("tarefasFrame")
                .opacity(0.2)
                .padding(.top, 633)
                .padding(.leading, 305)
            
            
            VStack {
                Text("Pepinos e mais pepinos")
                    .fontBob(size: 28)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 90)
                
                Text("Todos os dias você tem tarefas chatas para fazer e alguns apps para te ajudar com elas.\n\nTudo isso enquanto tenta se manter vivo e fugir de ligações de telemarketing.\n\nQualquer semelhança com a vida adulta não é mera coincidência. Boa sorte!")
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 160)
                    .padding(.vertical)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 300, height: 50)
                    
                    Text("Começar")
                        .foregroundColor(Color("Blue"))
                        .bold()
    
                }
                .padding(20)
                
            }
        }
    }
}
struct OnboardingFinal_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFinal()
    }
}
