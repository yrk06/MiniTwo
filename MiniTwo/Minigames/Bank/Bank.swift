//
//  ARTestts.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

struct Bank : View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @EnvironmentObject var stsMan : StatusManager
    
    @State var h = false
    @State var w = false
    
    @State var type = Int8.random(in: 1...3)
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("BankImage")
                        .opacity(0.5)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(uiColor: .systemGray4))
                                .frame(maxWidth: 50)
                            Spacer()
                            Image(systemName: "eye.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 17)
                                .foregroundColor(.white)
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 17)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.horizontal, 20)
                        Text("Olá, [nome do adulto]")
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                            .padding(.horizontal, 20)
                    }
                }
                .background(Color("BankAccent"))
                VStack (alignment: .leading) {
                    Text("Conta")
                        .font(.headline)
                    Text("R$ 3,20")
                        .font(.title3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical)
                
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(0..<5) {
                            _ in
                            Button {} label: {
                                VStack {
                                    Text("R$")
                                        .font(.title3)
                                        .padding(24)
                                        .background(Color(uiColor: .systemGray4))
                                        .cornerRadius(40)
                                    Text("Área Pix")
                                        .font(.callout)
                                        .bold()
                                }
                                
                                
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                        }
                    }
                }
                
                HStack {
                    Text("Você tem **\(objMan.allObjectives.filter({$0.objective == .boleto && $0.done == false}).count) boletos** a vencer até o dia 24 de agosto!")
                    Spacer()
                    NavigationLink {
                        BankPaymentOption()
                        //objMan.complete_mission(type: .boleto)
                        
                    } label: {
                        Text("Pagar")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color("BankAccent"))
                            .cornerRadius(40)
                    }
                    
                }
                .padding()
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(16)
                .padding()
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Cartão de crédito")
                        .bold()
                    Text("Fatura atual\n***")
                        .font(.footnote)
                        .padding(.top)
                    Text("Seu cartão foi bloqueado por suspeita de fraude. Ligue para a sua agência para desbloquear.\n\nTelefone 1 (234) 567-89001")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top)
                    
                    HStack {
                        Text("Ligar para agência")
                            .bold()
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.black)
                            .cornerRadius(16)
                        Text("Ignorar")
                            .foregroundColor(.blue)
                            .padding(8)
                    }.padding(.top)
                    
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
          if !h && !w {
            switch type {
            case 1:
                BPopUp(headline: "Você merece!", op_1: $h, op_2: $w)
            case 2:
                BPopUp(headline: "Chega de pepinos!", op_1: $h, op_2: $w)
            case 3:
                BPopUp(headline: "Realize seu sonho agora mesmo!", op_1: $h, op_2: $w)
            default:
                Text("No pop up :(")
            }
        }
            
        }
    }
}


struct Bank_Previews: PreviewProvider {
    static var previews: some View {
        let objMan = ObjectiveManager()
        Bank()
            .environmentObject(objMan)
            .task {
                objMan.fill_objectives(n: 15)
            }
    }
}
