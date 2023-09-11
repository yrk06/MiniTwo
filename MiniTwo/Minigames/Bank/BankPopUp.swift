//
//  PopUpSystem.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

var phrases : [String: String] = [
    "Você merece!" : "Não sobra dinheiro para sair com os amigos no fim de semana? Seus problemas acabaram!\n\nAbra as asas para o empréstimo e voe nas correntes emocionantes da dívida imediata - porque quem precisa de gravidade financeira quando se pode flutuar nas nuvens de possibilidades?",
    "Chega de pepinos!" : "A gente sabe que cuidar de uma casa, pagar os boletos e ainda ter que se manter vivo é cansativo e custa caro.\n\nPor isso, estamos aqui para te oferecer uma mãozinha - ou talvez um pepino cortado em rodelas bem fininhas. Deixe-se levar pelo empréstimo e abrace a montanha-russa eletrizante da dívida relâmpago!",
    "Realize seu sonho agora mesmo!" : "Quer viajar o mundo, ter uma mansão ou apenas ir para aquele show imperdível?\n\nQuem precisa de paciência quando se tem crédito ilimitado? Faça um empréstimo e abrace a alegria da dívida instantânea - afinal, o amanhã é superestimado em relação ao hoje maravilhoso!"
]

struct BPopUp : View {
    
    var headline : String!
    
    var images : String!
    
    @Binding var op_1 : Bool
    @Binding var op_2 : Bool
    
    @State var pop_up_done : Bool = false
    
    var reversed : Int8 = Int8.random(in: 1...10)
    
    var body: some View {
        if (!pop_up_done)
        {
            VStack {
                ZStack {
                    
                    Image(images)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 145)
                        .cornerRadius(16)
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            pop_up_done = true
                        }
                    }) {
                            Image(systemName: "x.circle.fill")
                            .font(.title3)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 310)
                    .padding(.bottom, 110)
    
                }
            
                VStack (alignment: .leading) {
                    Text(headline)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical)
                    Text(phrases[headline]!)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                }
                
                HStack {
                    
                    Button {
                        withAnimation(.spring()) {
                            if (reversed == 1) {
                                op_1 = true
                            } else {
                                op_2 = true
                            }
                            pop_up_done = true
                        }
                    } label: {
                        if (reversed == 1) {
                            Text("Ler termos e condições")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding()
                            
                        } else {
                            Text("Eu mereço")
                                .font(.callout)
                                .foregroundColor(.white)
                                .padding(16)
                                .bold()
                                .frame(width: 121)
                                .background {
                                    Color("OrangeFood")
                                }
                                .cornerRadius(14)
 
                        }
                    }
                    
                    Spacer()
                    
                    
                    Button {
                        withAnimation(.spring()) {
                            if (reversed == 1) {
                                op_2 = true
                            } else {
                                op_1 = true
                            }
                            pop_up_done = true
                        }
                    } label: {
                        if (reversed == 1) {
                            Text("Eu mereço")
                                .foregroundColor(.white)
                                .font(.callout)
                                .padding(16)
                                .bold()
                                .frame(width: 121)
                                .background {
                                    Color("OrangeFood")
                                }
                                .cornerRadius(14)

                                    
                        } else {
                            Text("Ler termos e condições")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding()
                            
                            
                        }
                    }
                    
                }
                
                .padding(.vertical)
                
            }
            .padding()
            .background
            {
                Color.black
            }
            .cornerRadius(16)
            .PopU()
            .shadow(radius: 10, x: 5, y: 5)
            .padding()
        }
    }
}
