//
//  BankCongratsLoan.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 10/09/23.
//

import SwiftUI

struct BankCongratsLoan: View {
    var body: some View {
        
        ZStack {
            Text("pepinobankpepinobankpepinobankpepinobankpepinobankpepinobankpepinobankpepinobank")
                .fontBob(size: 94)
                .tracking(-20)
                .foregroundColor(.white)
                .opacity(0.05)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, -10)
                .padding(.trailing, -50)
                .padding(.bottom, -130)
                .padding(.top, -130)
            
            VStack {
                    Image("parabensPop")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(16)
                        .padding(.top, 100)
                        .padding(.horizontal, 16)
                        .frame(width: .infinity, height: 200)
                
                    VStack (alignment: .leading) {
                        
                        Text("Parabéns!")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 80)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                        
                        Text("Bem-vindo à realidade entusiasmante do endividamento! Parabéns por mergulhar de cabeça nesse maravilhoso mundo de taxas, parcelas e surpresas financeiras! \n\nEntão, prepare-se para abraçar as maravilhas da dívida, onde cada pagamento é como um pequeno troféu que lembra você do quão longe está disposto a ir para alcançar seus desejos imediatos!")
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                        
                        NavigationLink(destination: Bank()){
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .frame(width: 300, height: 50)
                                
                                Text("Continuar")
                                    .foregroundColor(.white)
                
                            }
                            .padding(40)
                        }
                    }
                Spacer()
            }
        }
        .background(Color("Blue"))
        .edgesIgnoringSafeArea(.bottom)
            
        }
    }


struct BankCongratsLoan_Previews: PreviewProvider {
    static var previews: some View {
        BankCongratsLoan()
    }
}
