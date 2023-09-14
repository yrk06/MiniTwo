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
    @State var popup_dismissed = false
    
    @State var type = Int8.random(in: 1...3)
    
    @State var cupom_alert = false
    
    var listaImagens = ["reaisDoodle", "creditDoodle", "transfDoodle", "cobrarDoodle"]
    var nomesImagens = ["Área Pix", "Fatura", "Transferir", "Cobrar"]
    var alertTitle = ["Olha o golpe do Pix!", "Sua fatura ainda está aberta", "Celular não autorizado", "Não há cobranças disponíveis"]
    var alertDescription = ["Este celular não está autorizado a fazer transações.", "Mas já adiantamos que é maior do que você pensa...", "Para poder fazer transferências neste dispositivo, autorize-o.", "Você não emprestou dinheiro a ninguém para poder cobrar."]
    
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
//                            Image(systemName: "eye.slash")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(maxHeight: 17)
//                                .foregroundColor(.white)
//                            Image(systemName: "questionmark.circle")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(maxHeight: 17)
//                                .foregroundColor(.white)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        Text("Boas vindas")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
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
                            ForEach(0..<4) {
                                i in
                                Button(action: {
                                    cupom_alert = true
                                }, label: {
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
                                    
                                })
                                .alert(isPresented: $cupom_alert) {
                                    Alert(
                                        title: Text(alertTitle[i]),
                                        message: Text(alertDescription[i]),
                                        dismissButton: .default(Text("OK")) {
                                            cupom_alert = false
                                        }
                                    )
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
                                    .padding([.horizontal], 30)
                                    .padding([.vertical], 10)
                                    .background(Color("OrangeFood"))
                                    .cornerRadius(40)
                                    .Boom()
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
                            .padding(.top)
                        
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
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                Spacer()
                
                
                
            }
            .sheet(isPresented: $w) {
                ScrollView {
                    VStack {
                        Image("parabensPop")
                            .resizable()
                            .scaledToFit()
                        VStack {
                            Text("Parabéns")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .bold()
                            
                            Text("Bem-vindo à realidade entusiasmante do endividamento! Parabéns por atravessar o portal dos empréstimos e mergulhar de cabeça nesse maravilhoso mundo de taxas, parcelas e surpresas financeiras! Como um verdadeiro aventureiro monetário, você está prestes a descobrir que nada é tão emocionante quanto comprometer seu futuro por um presente efêmero.\n\nEntão, prepare-se para abraçar as maravilhas da dívida, onde cada pagamento é como um pequeno troféu que lembra você do quão longe está disposto a ir para alcançar seus desejos imediatos!")
                        }
                        .padding(32)
                    }
                }
                //.padding(.top, 32)
                .presentationDragIndicator(.visible)
                    .onAppear {
                        popup_dismissed = true
                    }
            }
            .sheet(isPresented: $h) {
                ScrollView {
                    VStack (alignment: .leading, spacing: 16) {
                        Text("Termos e condições")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                        
                        Group {
                            
                            
                            Text("1. Empréstimos Empolgantes")
                                .font(.title3)
                                .bold()
                            
                            Text("Ao solicitar um empréstimo conosco, você está prestes a receber uma quantia de crédito que fará você se sentir como um milionário instantâneo. No entanto, a alegria de gastar logo será substituída pelo peso da dívida que se acumula.")
                            
                            Text("2. Taxas Amigáveis")
                                .font(.title3)
                                .bold()
                            
                            Text("Nossas taxas de juros são tão amigáveis quanto um abraço, mas, ao contrário do abraço, elas não vão embora. Você mal notará o dinheiro saindo da sua conta enquanto gasta, mas quando perceber, já será tarde demais.")
                            
                            Text("3. Prazos Flexíveis (não para você)")
                                .font(.title3)
                                .bold()
                            
                            Text("Oferecemos prazos de pagamento que parecem se estender por toda uma vida. Você pode pensar que isso é ótimo, mas, na verdade, estará pagando por anos e anos (ou até mais).")
                            
                            Text("4. Perdão")
                                .font(.title3)
                                .bold()
                            
                            Text("Se você achar que não consegue mais pagar, não se preocupe! Oferecemos um serviço de perdão de dívidas. Mas, como em todo bom jogo, há um preço a ser pago, e ele geralmente é mais alto do que você pode imaginar.")
                            
                            Text("5. Garantia de Frustração")
                                .font(.title3)
                                .bold()
                            
                            Text("Nossos empréstimos são projetados para mantê-lo em um ciclo vicioso de pagamento. Você continuará trabalhando para pagar a dívida, mas é improvável que a quite. A satisfação de ser derrotado pela dívida é quase inevitável.")
                        }
                        
                        Group {
                            
                            
                            Text("6. Penalidades Surpresa")
                                .font(.title3)
                                .bold()
                            
                            Text("De tempos em tempos, surpreenderemos você com penalidades inesperadas, como acontece em um jogo com reviravoltas. É uma sensação tão emocionante descobrir que precisa pagar mais do que esperava!")
                            
                            Text("7. Rescisão Complicada")
                                .font(.title3)
                                .bold()
                            
                            Text("Se você decidir que não quer mais participar desse jogo de dívidas, não se preocupe. A rescisão pode ser uma jornada complicada, repleta de obstáculos e desafios inesperados.")
                            
                            Text("8. Assinatura Vitalícia")
                                .font(.title3)
                                .bold()
                            
                            Text("Ao assinar este empréstimo, você está basicamente se comprometendo a um contrato de longo prazo, que pode parecer uma sentença de vida. Lembre-se, a vida é curta, mas a dívida é persistente!")
                            
                            Text("Lembre-se, caro usuário, estamos aqui para tornar sua experiência financeira verdadeiramente memorável - não apenas pela diversão, mas também pela jornada eterna de pagar essa dívida real. Boa sorte, e que a sorte (ou a falta dela) esteja sempre do seu lado!")
                        }
                            
                    }
                    
                }
                .padding(32)
                .presentationDragIndicator(.visible)
                
                
            }
            
//            if !h && !w && !popup_dismissed {
//                switch type {
//                case 1:
//                    BPopUp(headline: "Você merece!", images: "voceMerece", op_1: $h, op_2: $w)
//                case 2:
//                    BPopUp(headline: "Chega de pepinos!", images: "chegaPepinos", op_1: $h, op_2: $w)
//                case 3:
//                    BPopUp(headline: "Realize seu sonho agora mesmo!", images: "realizeSonho", op_1: $h, op_2: $w)
//                default:
//                    Text("No pop up :(")
//                }
//            }
            if !h && !w && !popup_dismissed {
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


struct Bank_Previews: PreviewProvider {
    static var previews: some View {
        let objMan = ObjectiveManager()
        NavigationStack {
            Bank()
                .environmentObject(objMan)
                .task {
                    objMan.fill_objectives(n: 15)
                }
        }
        
    }
}
