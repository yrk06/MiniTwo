//
//  BankPaymentOption.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import SwiftUI

struct BankPaymentOption: View {
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
        
                    Text("Pagar boleto")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                    
//                    Spacer()
                    
                    HStack {
                        NavigationLink {
                            ARView()
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
                        
                        NavigationLink {} label: {
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
                    .padding(.horizontal,36)
                    .padding(.bottom, 16)
                }
                
                NavigationLink {
                    BankTyping()
                } label: {
                    VStack {
                        Image(systemName: "barcode")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 27)
                            .foregroundColor(.black)
                            .padding(20)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(40)
                            .frame(maxWidth: 80)
                        Text("Manual")
                            .foregroundColor(.black)
                            .font(.callout)
                    }
                }
            }
            .frame(width: .infinity, height: 370)
            .background(Color("Blue"))
            
            Spacer()
            
            VStack {
            Text("Conheça nossas oportunidades")
            .font(.callout)
            .bold()
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
                HStack {
                    
                    VStack (alignment: .leading) {
                        Image("cobrarDoodleAzul")
                    }
                    .padding(.horizontal, 10)
                   
                    
                    VStack (alignment: .leading) {
                        Text("Realize seu sonho agora mesmo")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.bottom, 2)
                        
                        Text("Quer viajar o mundo, ter uma mansão ou apenas ir para aquele show imperdível?")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.vertical, 20)
                    
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Blue"))
                        .padding()
    
                }
//                .padding(20)
                
                Divider()
                
                HStack (alignment: .center)  {
                    
                    VStack (alignment: .leading) {
                        Image("creditDoodleAzul")
                    }
                    .padding(.horizontal, 10)
                    
                    
                    VStack (alignment: .leading) {
                        Text("Chega de pepinos")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.bottom, 2)
                        
                        Text("Estamos aqui para te oferecer uma mãozinha: um pepino cortado em rodelas bem fininhas.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    
                    }
                    .padding(.vertical, 20)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Blue"))
                        .padding()
    
                }
//                .padding(20)
                
                Divider()
                
                HStack {
                    
                    VStack (alignment: .leading) {
                        Image("reaisDoodleAzul")
                    }
                    .padding(.horizontal, 10)
                    
           
                    VStack (alignment: .leading) {
                        Text("Você merece")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.bottom, 2)
                        
                        Text("Não sobra dinheiro para sair com os amigos no fim de semana? Seus problemas acabaram!")
                            .font(.caption)
                            .foregroundColor(.gray)
      
                    }
                    .padding(.vertical, 20)
                    
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
            BankPaymentOption()
        }
    }

