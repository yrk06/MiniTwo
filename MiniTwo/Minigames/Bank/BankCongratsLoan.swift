//
//  BankCongratsLoan.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 10/09/23.
//

import SwiftUI

struct BankCongratsLoan: View {
    var body: some View {
        
        
        VStack {
        
            ZStack {
                Color("Blue")
                    .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    
                    Text("pepinobankpepinobank")
                        .fontBob(size: 94)
                        .tracking(-20)
                        .foregroundColor(.white)
                        .opacity(0.1)
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, -10)
                        .padding(.trailing, -50)
                        .padding(.bottom, -130)
                        .padding(.top, -130)
                    
                    Text("Parabéns!")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 20)
                    
                    
                }
            }
        .background(Color("Blue"))
        
        
            
            
        
                            Image("parabensPop")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 400, height:300)
                                .cornerRadius(8)
            
                            VStack (alignment: .leading) {
                                Text("Parabéns!")
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .foregroundColor(.white)
            
                                Text("Bem-vindo à realidade entusiasmante do endividamento! Parabéns por mergulhar de cabeça nesse maravilhoso mundo de taxas, parcelas e surpresas financeiras! \n\nEntão, prepare-se para abraçar as maravilhas da dívida, onde cada pagamento é como um pequeno troféu que lembra você do quão longe está disposto a ir para alcançar seus desejos imediatos!")
                                    .foregroundColor(.white)
                                    .padding()
                            }
            
                    }
            
        }
    

    }


struct BankCongratsLoan_Previews: PreviewProvider {
    static var previews: some View {
        BankCongratsLoan()
    }
}
