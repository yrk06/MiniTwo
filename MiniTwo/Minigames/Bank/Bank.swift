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
    
    var listaImagens = ["reaisDoodle", "barcodeDoodle", "creditDoodle", "transfDoodle", "cobrarDoodle"]
    var nomesImagens = ["Área Pix", "Pagar", "Emprestar", "Transferir", "Cobrar"]
    
    var body: some View {
        ZStack {
                VStack {
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
                        VStack {
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(Color("OrangeFood"))
                                        .frame(maxWidth: 50)
                                    
                                    Image("perfilDoodle")
                                    
                                }
                                
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
                    .background(Color("Blue"))
                    
                    ScrollView {
                        
                    VStack (alignment: .leading) {
                        Text("Conta")
                            .font(.headline)
                        Text("R$ 3,20")
                            .font(.title3)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            ForEach(0..<5) {
                                i in
                                Button {} label: {
                                    VStack {
                                        Image(listaImagens[i])
                                            .frame(width: 79, height: 80)
                                            .padding(2)
                                            .background(Color(uiColor: .black))
                                            .cornerRadius(200)
                                        
                                        Text(nomesImagens[i])
                                            .font(.callout)
                                            .bold()
                                    }
                                    
                                }
                                .padding(.horizontal, 12)
                                .foregroundColor(.black)
                            }
                        }
                    }
                        ZStack {
                            
                            Text("Pepinobankpepino")
                                .fontBob(size: 94)
                                .tracking(-20)
                                .foregroundColor(.white)
                                .opacity(0.1)
                                .ignoresSafeArea()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, -10)
                                .padding(.trailing, -50)
                                .padding(.vertical, -130)
                            
                            HStack {
                                Text("Você tem **\(objMan.allObjectives.filter({$0.objective == .boleto && $0.done == false}).count) boletos** a vencer até o fim da semana")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                
                                Spacer()
                                NavigationLink {
                                    BankPaymentOption()
//                                    objMan.complete_mission(type: .boleto)
                                    
                                } label: {
                                    Text("Pagar")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .padding(.horizontal)
                                        .background(Color("OrangeFood"))
                                        .cornerRadius(40)
                                }
                                
                            }
                            
                        }
                    .padding()
                    .background(Color("Blue"))
                    .cornerRadius(16)
                    .padding()
                    
                    
                    Divider()
                    
                    VStack (alignment: .leading) {
                        Text("Cartão de crédito")
                            .bold()
                        
                        Image("cartaoDoodle")
                        
                        Text("Seu cartão foi bloqueado por suspeita de fraude. \nLigue para a sua agência para desbloquear.\n\nTelefone 1 (234) 567-89001")
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
                            .background(Color("Blue"))
                            .cornerRadius(40)
                }
                
            ZStack {
                if !h && !w {
                    switch type {
                    case 1:
                        BPopUp(headline: "Você merece!", images: "voceMerece", op_1: $h, op_2: $w)
                    case 2:
                        BPopUp(headline: "Chega de pepinos!", images: "chegaPepinos", op_1: $h, op_2: $w)
                    case 3:
                        BPopUp(headline: "Realize seu sonho agora mesmo!", images: "realizeSonho", op_1: $h, op_2: $w)
                    default:
                        Text("No pop up :(")
                    }
                }
                
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
