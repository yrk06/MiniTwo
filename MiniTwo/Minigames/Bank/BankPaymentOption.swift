//
//  BankPaymentOption.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import SwiftUI

struct BankPaymentOption: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        
        VStack {
            ZStack {
                Text("pepinobankpepinobankpepinobankpepinobankpepino")
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
                    
                    VStack (alignment: .leading) {
                        Button {
                            dismiss()
                        }
                        
                    label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.trailing, 320)
                            .padding(.top, -50)
                            
                    }
                        
                    }
        
                    Text("Pagar boleto")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                    
                    
                    HStack {
                        NavigationLink {
                            ARView()
                                .firstTimeAlert(idx: 3, title: "Você perdeu seus boletos!", message: "Chegue perto dos boletos e toque neles para pagar.", gameManager: gameManager)
                        } label: {
          
                            VStack {
                                Image("scanDoodle")
                                    .frame(width: 100, height: 100)
                                    .padding(2)
                                    .background(Color(uiColor: .black))
                                    .cornerRadius(200)
                                
                                
                                Text("Automático")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .bold()
                            }
                        }
                        Spacer()
                        
                        NavigationLink {
                            BankTyping()
                                .firstTimeAlert(idx: 4, title: "Digite o código de barras", message: "Confira o boleto e digite os números corretamente.", gameManager: gameManager)
                        } label: {
                            VStack {
                                Image("barcodeDoodle")
                                    .frame(width: 100, height: 100)
                                    .padding(2)
                                    .background(Color(uiColor: .black))
                                    .cornerRadius(200)
                                
                                Text("Manual")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .bold()
             
                            }
                            
                        }
                    }
                    .padding(.horizontal,66)
                    .padding(.bottom, 16)
                }
            }
            .frame(height: 370)
            .frame(maxWidth: .infinity)
            .background(Color("Blue"))
            
            Spacer()
            
            VStack(alignment: .leading) {
            Text("Conheça nossas oportunidades")
            .font(.body)
            .bold()
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding([.top], 20)
            
                HStack {
                    
                    VStack (alignment: .leading) {
                        Image("cobrarDoodleAzul")
                            .frame(width:42, height:42)
                    }
                    .padding(.horizontal, 10)
                   
                    
                    VStack (alignment: .leading) {
                        Text("Realize seu sonho agora mesmo")
//                            .frame(width: 268)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.bottom, 2)
                        
                        Text("Quer viajar o mundo, ter uma mansão ou apenas ir para aquele show imperdível?")
                            .frame(height: 32)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 20)
                    Spacer()
                    
                    //Cada chevron é um botão. Cada um faz abrir um tipo de pop up sobre empréstimo.
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Blue"))
                        .padding()
    
                }
//                .padding(20)
                
                Divider()
                
                HStack (alignment: .center)  {
                    
                    VStack (alignment: .leading) {
                        Image("creditDoodleAzul")
                            .frame(width:42, height:42)
                    }
                    .padding(.horizontal, 10)
                    
                    
                    VStack (alignment: .leading) {
                        Text("Chega de pepinos")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.bottom, 2)
                        
                        Text("Estamos aqui para te oferecer uma mãozinha: um pepino cortado em rodelas bem fininhas.")
                            .frame(height: 32)
                            .font(.caption)
                            .foregroundColor(.gray)
                    
                    }
                    .padding(.vertical, 20)
                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Blue"))
                        .padding()
    
                }
//                .padding(20)
                
                Divider()
                
                HStack {
                    
                    VStack (alignment: .leading) {
                        Image("reaisDoodleAzul")
                            .frame(width:42, height:42)
                    }
                    .padding(.horizontal, 10)
                    
           
                    VStack (alignment: .leading) {
                        Text("Você merece")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                            .padding(.bottom, 2)
                        
                        Text("Não sobra dinheiro para sair com os amigos no fim de semana? Seus problemas acabaram!")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(height: 32)

      
                    }
                    .padding(.vertical, 20)
                    Spacer()

                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Blue"))
                        .padding()
                    
                }
//                .padding(20)
            
                
            }
            Divider()
            Spacer()

            }

        }
    }
    
    struct BankPaymentOption_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                BankPaymentOption()
                    .environmentObject(GameManager())
            }
        }
    }

