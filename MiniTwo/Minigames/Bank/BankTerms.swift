//
//  BankTerms.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 10/09/23.
//

import SwiftUI

struct BankTerms: View {
    @State private var recusarTapped = false
    
    var body: some View {
        
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
                
                
                VStack (alignment: .leading) {
                    Button {
                    }
                    
                label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                }
                    
                    Text("Termos e condições")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 20)
                    
                }
                
            }
            .background(Color("Blue"))
            //        Spacer()
            
            ScrollView {
                VStack (alignment: .leading){
                    
                    Text("Sem asteriscos ou letras miúdas:")
                        .font(.title2)
                        .bold()
                        .padding(.vertical, 16)
                    
                    Text("Bla bla bla investimentos bla bla. Bla, escolhas bla bla bla. Bla bla bla bla bla bla pesquisa bla. Bla bla, mercado bla bla bla bla bla. Bla, bla bla bla bla bla riscos bla bla bla bla. Diversificação bla bla bla bla análise bla bla. Educação bla bla bla bla bla bla. Lembre-se, bla bla bla bla sucesso bla bla bla bla bla. Bla bla bla bla bla bla bla bla bla. Bla bla bla bla bla bla bla bla bla bla. \n\nBla bla bla bla investir bla bla bla bla bla. Bla, cuidado bla bla bla bla bla. Antes bla bla bla recursos bla bla bla bla. Bla entender bla bla bla investimentos bla bla. Bla, tipos bla bla bla bla bla investimentos bla. Bla, ações bla bla bla bla bla crescimento bla. Bla, flutuações bla bla bla bla bla mercado bla. Bla, títulos bla bla bla bla bla estáveis bla. Bla, retornos bla bla bla bla bla menores bla. Bla, investir bla bla bla bla bla mercados bla. Bla, diversificação bla bla bla bla bla portfólio bla. Bla, riscos cambiais bla bla bla bla bla. \n\nBla bla bla bla mercado bla bla bla bla bla. Bla, alta bla bla bla bla bla baixa bla. Bla, comprar bla bla bla bla bla vender bla. Bla habilidade bla bla bla bla bla. Bla, longo prazo bla bla bla bla bla 'buy and hold' bla. Bla, ciclos bla bla bla bla bla mercado bla. Bla, análise técnica bla bla bla bla bla preços bla. Bla, análise fundamentalista bla bla bla bla bla fundamentos bla. \n\nBla bla bla bla diversificação bla bla bla bla bla. Bla, ativos bla bla bla bla bla setores bla. Bla, regiões bla bla bla bla bla. Bla, impacto bla bla bla bla bla mau desempenho bla. Bla, área específica bla bla bla bla. Bla, reserva de emergência bla bla bla bla proteger bla. Bla, liquidez bla bla bla bla bla venda forçada bla.\n\nBla bla bla bla mercado bla bla bla bla bla. Bla, imprevisível bla bla bla bla bla. Bla, educação bla bla bla bla bla bla. \n\nAgora, pense bem: aceitar esse empréstimo? Talvez fosse mais sensato fugir gritando em direção oposta.\n\nSim, você vai perder se aceitar.")
                        .foregroundColor(.black)
                    
                }
                .padding()
                
                HStack {
                    
                    NavigationLink {
                    Bank()
                    } label: {
                        Text("Recusar")
                            .foregroundColor(.white)
                            .font(.callout)
                            .padding(16)
                            .bold()
                            .frame(width: 121)
                            .background {
                                Color("OrangeFood")
                            }
                            .cornerRadius(14)
                    }
//                    Button {
//                        withAnimation(.spring()) {
//                            //código do botão
//                        }
//                    } label:
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.spring()) {
                            //código do botão
                        }
                    } label: {
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
                    }
                }
                .padding()
                
            }
            
        }
        
    }
}

struct BankTerms_Previews: PreviewProvider {
    static var previews: some View {
        BankTerms()
    }
}
