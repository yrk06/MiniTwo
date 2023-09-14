//
//  House.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI

struct House: View {
    
    var body: some View {
        VStack (spacing: 0) {
            VStack (alignment: .leading) {
                HStack {
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color(uiColor: .white))
                            .frame(maxWidth: 50)
                        
                        Image("perfilDoodlePreto")
                        
                       
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "house.fill")
                        Text("pepino home")
                            .font(.system(size: 17))
                            .fontWidth(.expanded)
                            .fontWeight(.bold)
                            
                            
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    
                    .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                 
                    .cornerRadius(8)
                }
                .padding(.bottom, 48)
                
                
                Text("Boas vindas")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWidth(.expanded)
                    .fontWeight(.bold)
                    .kerning(-0.4)
        
                Text("Cuide da sua casa e tenha um ótimo dia!")
                    .foregroundColor(.white)
                    .padding(.top, -22)
                
                
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
            .padding(.horizontal, 20)
            .background(Color(uiColor: .black))
            

            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    NavigationLink {
                        RoomCleaningMinigame()
                    } label: {
                        
                        ZStack {
                            VStack (alignment: .leading) {
                                        Text("Online")
                                            .font(.system(size: 14))
                                        Text("Aspirador")
                                            .font(.system(size: 36))
                                            .fontWidth(.expanded)
                                            .fontWeight(.bold)
                                            .kerning(-0.8)
                                            .padding(.bottom, 20)
                                        
                                        Text("Dispositivo pronto para limpar.")
                                            .font(.system(size: 14))
                                            .padding(.bottom, 20)
                                        
                                        HStack {
                                            Spacer()
                                        }
                                        
                                        Image(systemName: "arrow.right")
                                            .padding(4)
                                            .padding(.horizontal)
                                            .background(Color("Blue"))
                                            .cornerRadius(30)
                                            .Boom()
                                    }
                                    .foregroundColor(.white)
                                    .padding(24)
                                    .background(
                                        Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941)
                                            .cornerRadius(16)
                                    )
                                    .padding()
                                    .overlay(
                                        Text("ON")
                                            .fontBob(size: 209)
                                            .foregroundColor(.white)
                                            .opacity(0.06)
    )
                                }
                        .padding(.bottom, -20)
                        
                            }
                    
                    NavigationLink {
                        Panela()
                    } label: {
                        ZStack {
                                    VStack (alignment: .leading) {
                                        Text("Online")
                                            .font(.system(size: 14))
                                        Text("Panela")
                                            .font(.system(size: 36))
                                            .fontWidth(.expanded)
                                            .fontWeight(.bold)
                                            .kerning(-0.8)
                                            .padding(.bottom, 20)
                                        
                                        Text("Dispositivo pronto para cozinhar.")
                                            .font(.system(size: 14))
                                            .padding(.bottom, 20)
                                        
                                        HStack {
                                            Spacer()
                                        }
                                        
                                        Image(systemName: "arrow.right")
                                            .padding(4)
                                            .padding(.horizontal)
                                            .background(Color("Blue"))
                                            .cornerRadius(30)
                                            .Boom()
                                    }
                                    .foregroundColor(.white)
                                    .padding(24)
                                    .background(
                                        Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941)
                                            .cornerRadius(16)
                                    )
                                    .padding()
                                    .overlay(
                                        Text("ON")
                                            .fontBob(size: 209)
                                            .foregroundColor(.white)
                                            .opacity(0.06)
                                    )
                                }
                        .padding(.bottom, -20)
                            }
                    
                    
                    NavigationLink {
                        ToiletMinigame()
                    } label: {
                        ZStack {
                                    VStack (alignment: .leading) {
                                        Text("Online")
                                            .font(.system(size: 14))
                                        Text("Vaso sanitário")
                                            .font(.system(size: 36))
                                            .fontWidth(.expanded)
                                            .fontWeight(.bold)
                                            .kerning(-0.8)
                                            .padding(.bottom, 20)
                                        
                                        Text("Dispositivo pronto para desentupir.")
                                            .font(.system(size: 14))
                                            .padding(.bottom, 20)
                                        
                                        HStack {
                                            Spacer()
                                        }
                                        
                                        Image(systemName: "arrow.right")
                                            .padding(4)
                                            .padding(.horizontal)
                                            .background(Color("Blue"))
                                            .cornerRadius(30)
                                            .Boom()
                                    }
                                    .foregroundColor(.white)
                                    .padding(24)
                                    .background(
                                        Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941)
                                            .cornerRadius(16)
                                    )
                                    .padding()
                                    .overlay(
                                        Text("ON")
                                            .fontBob(size: 209)
                                            .foregroundColor(.white)
                                            .opacity(0.06)
                                    )
                                }
                    }
                }
                .background(Color(uiColor: .black))
                .padding(.bottom, 96)
            }
        }
        .background(Color(uiColor: .black))
        
    }
}

struct House_Previews: PreviewProvider {
    static var previews: some View {
        House()
    }
}
