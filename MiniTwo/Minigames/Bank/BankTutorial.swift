//
//  BankTutorial.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 10/09/23.
//

import SwiftUI

struct BankTutorial: View {
    var body: some View {
        
        ZStack {
            
            Text("pepinobankpepinobankpepinobankpepinobankpepinobankpepinobankpepinobankpepinobank")
                .fontBob(size: 94)
                .tracking(-20)
                .foregroundColor(.gray)
                .opacity(0.05)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, -10)
                .padding(.trailing, -50)
                .padding(.bottom, -130)
                .padding(.top, -130)
            
            Image("boletoBlur")
                .padding(.leading, -220)
                .padding(.top, 650)
            
            Image("boletoBlur")
                .padding(.leading, 300)
                .padding(.top, -480)
            
            Image("barcodeModel")
                .resizable()
                .frame(width: 122, height: 135)
                .padding(.leading, -240)
                .padding(.top, -320)
            
            Image("barcodeModel")
                .resizable()
                .frame(width: 122, height: 135)
                .padding(.leading, 340)
                .padding(.top, 470)
                
            
            VStack {
                
                Text("PUTS, VOCÊ PERDEU SEUS BOLETOS!")
                    .fontBob(size: 34)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    
                
                
                Text("Você precisa se organizar melhor... \nEncontre os boletos e toque para se livrar.")
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: Bank()){
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .frame(width: 300, height: 50)
                        
                        Text("Começar")
                            .foregroundColor(.white)
        
                    }
                    .padding(40)
                }
            }

            
        }
        .frame(width: .infinity, height: .infinity)
        .background(.white)
        
        
        
    }
}

struct BankTutorial_Previews: PreviewProvider {
    static var previews: some View {
        BankTutorial()
    }
}
