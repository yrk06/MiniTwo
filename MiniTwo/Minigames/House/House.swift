//
//  House.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI

struct House: View {
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                HStack {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Pepino Home")
                            .font(.system(size: 17))
                            .bold()
                            
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(.black)
                    .cornerRadius(8)
                    Spacer()
                }
                
                
                Text("Boas vindas")
                    .font(.system(size: 40))
                    .bold()
                Text("Tenha um  ótimo dia!")
                
//                HStack {
//                    Text("31 AGO")
//                    Spacer()
//                    HStack {
//                        Image(systemName: "power")
//                        Text("ON")
//
//                    }
//                    .bold()
//                    .padding()
//                    .background(.white)
//                    .cornerRadius(12)
//
//                }.padding(.vertical)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .background(Color("OrangeFood"))
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    NavigationLink {
                        RoomCleaningMinigame()
                    } label: {
                        VStack (alignment: .leading) {
                            Text("Online")
                                .font(.system(size: 14))
                            Text("Aspirador")
                                .font(.system(size: 36))
                                .bold()
                            Text("O aspirador de pó está ativado")
                                .font(.system(size: 14))
                            HStack {
                                Spacer()
                            }
                            Image(systemName: "arrow.right")
                                .padding(4)
                                .padding(.horizontal)
                                .background(Color("Blue"))
                                .cornerRadius(30)
                            
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                        .TextBackground(palavra: "ON", count: 1)
                        .background(Color("GrayBackItems"))
                        .cornerRadius(16)
                        .padding()
                    }
                    
                    NavigationLink {
                        Panela()
                    } label: {
                        VStack (alignment: .leading) {
                            Text("Online")
                                .font(.system(size: 14))
                            Text("Panela")
                                .font(.system(size: 36))
                                .bold()
                            Text("O forno está ativado")
                                .font(.system(size: 14))
                            HStack {
                                Spacer()
                            }
                            Image(systemName: "arrow.right")
                                .padding(4)
                                .padding(.horizontal)
                                .background(Color("Blue"))
                                .cornerRadius(30)
                            
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                        .TextBackground(palavra: "ON", count: 1)
                        .background(Color("GrayBack"))
                        .cornerRadius(16)
                        .padding()
                    }
                    
                    NavigationLink {
                        ToiletMinigame()
                    } label: {
                        VStack (alignment: .leading) {
                            Text("Online")
                                .font(.system(size: 14))
                            Text("Vaso sanitário")
                                .font(.system(size: 36))
                                .bold()
                            Text("O vaso sanitário está ativado")
                                .font(.system(size: 14))
                            HStack {
                                Spacer()
                            }
                            Image(systemName: "arrow.right")
                                .padding(4)
                                .padding(.horizontal)
                                .background(Color("Blue"))
                                .cornerRadius(30)
                            
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                        .TextBackground(palavra: "ON", count: 1)
                        .background(Color("GrayBack"))
                        .cornerRadius(16)
                        .padding()
                    }
                }
                .padding(.bottom, 96)
            }
        }
        
    }
}

struct House_Previews: PreviewProvider {
    static var previews: some View {
        House()
    }
}
