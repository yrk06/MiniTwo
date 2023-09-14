//
//  iFood.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 29/08/23.
//

import SwiftUI

struct CardH : View {
    
    var verbatim : String
    var imagem : String
    
    init(_ verbatim: String, imagem: String) {
        self.verbatim = verbatim
        self.imagem = imagem
    }
    
    var body: some View {
        VStack {
            Image(imagem)
            
            Text(verbatim)
                .font(.caption2)
                .frame(width: 100)
                .foregroundColor(.black)
        }
    }
}

struct CardV : View {
    
    let food : FoodCard
    
    init(food: FoodCard) {
        self.food = food
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(food.nome)
                .font(.subheadline)
                .bold()
                .padding(.bottom, 2)
            Text(food.verbatim)
                .font(.caption2)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 4)
                .frame(alignment: .leading)
            Text("R$\(String(format: "%.2f", food.price))")
                .font(.headline)
        }
        .foregroundColor(.white)
        .frame(width: 160, height: 100)
    }
}

struct CardLojas : View {
    
    let food : FoodCard
    var imagem : String
    
    init(food: FoodCard, imagem: String) {
        self.food = food
        self.imagem = imagem
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(imagem)
            
            VStack(alignment: .leading, spacing: 12) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(food.nome_restaurante)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .foregroundColor(.black)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .font(.caption2)
                        Text("5,0 •")
                            .font(.caption2)
                            .foregroundColor(.black)
                        Text(food.tipo_cozinha)
                            .font(.caption2)
                            .foregroundColor(.black)
                        Text("• 0.9km")
                            .font(.caption2)
                            .foregroundColor(.black)
                    }
                }
                            
                HStack(spacing: 4) {
                    Text("30 - 40min •")
                        .font(.caption2)
                        .foregroundColor(.black)
                    Text("Grátis")
                        .font(.caption2)
                        .foregroundColor(Color("OrangeFood"))
                }
            }
            
            Spacer()
            
            Image(systemName: "heart")
                .foregroundColor(.black)
        }
    }
}

struct CardsVantagens: View {
    let card : VantagensPepino
    @State private var showAlert = false
    
    init(card: VantagensPepino) {
        self.card = card
    }
    
    var body: some View {
        
        Button(action: {
            showAlert = true
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: 125, height: 125)
                VStack(spacing: 8){
                    Image(card.imagem)
                    
                    VStack(spacing: 4){
                        Text(card.titulo)
                            .font(.caption)
                            .bold()
                            .foregroundColor(.black)
                        Text(card.descricao)
                            .font(.caption2)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 110, height: 110)
            }
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.alertTitulo),
                message: Text(card.alertDescricao),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                }
            )
        }
    }
}


struct FoodCard {
    var nome : String
    var nome_restaurante : String
    var tipo_cozinha : String
    var verbatim : String
    var price : Float
    var descricao : String
    var color : Color
    var colorButton : Color
    var colorDescricao : Color
    var imagem : String
    var incrementoUm: String
    var incrementoDois: String
    var incrementoTres: String
    var incrementoQuatro: String
    var incrementoCinco: String
}

var food_cards = [
    FoodCard(nome: "Pepinada", nome_restaurante: "Casa do Pepino", tipo_cozinha: "Brasileira", verbatim: "Delicioso prato tipicamente brasileiro com um toque refrescante", price: 65.99, descricao: "A mais gostosa da cidade. Para os loucos por pepino. \n\nA pepinada é uma especiaria brasileira feita com pepinos reconhecida internacionalmente. \n\nAcompanha picles e farofa.", color: Color("OrangeFood"), colorButton: Color("DarkGreen"), colorDescricao: .white, imagem: "orderBrasileira", incrementoUm: "incrementoPepinadaUm", incrementoDois: "incrementoPepinadaDois", incrementoTres: "incrementoPepinadaTres", incrementoQuatro: "incrementoPepinadaQuatro", incrementoCinco: "incrementoPepinadaCinco"),
    FoodCard(nome: "Pizza de pepino", nome_restaurante: "Pepino's Pizza", tipo_cozinha: "Italiana", verbatim: "Individual", price: 54.99, descricao: "O verdadeiro suculento. Para os loucos por pepino. \n\nPizza de pepino com mussarela de búfala regada por molho de tomates caseiro e coberto queijo mussarela. \n\nAcompanha picles.", color: Color("Blue"), colorButton: Color("DarkGreen"), colorDescricao: .white, imagem: "orderItaliana", incrementoUm: "incrementoPizzaUm", incrementoDois: "incrementoPizzaDois", incrementoTres: "incrementoPizzaTres", incrementoQuatro: "incrementoPizzaQuatro", incrementoCinco: "incrementoPizzaCinco"),
    FoodCard(nome: "Salada de pepino", nome_restaurante: "PepinoWay", tipo_cozinha: "Saudável", verbatim: "Individual", price: 20.50, descricao: "A mais gostoso da cidade. Para os loucos por pepino. \n\nA salada de pepino é feita com pepinos frescos e verdinhos. Você pode montar sua salada como quiser. \n\nPode acompanhar picles e queijo branco.", color: Color("DarkGreen"), colorButton: Color("OrangeFood"), colorDescricao: .white, imagem: "orderSaudavel", incrementoUm: "incrementoSaladaUm", incrementoDois: "incrementoSaladaDois", incrementoTres: "incrementoSaladaTres", incrementoQuatro: "incrementoSaladaQuatro", incrementoCinco: "incrementoSaladaCinco"),
    FoodCard(nome: "Burger de pepino", nome_restaurante: "Pepino Donald's", tipo_cozinha: "Americana", verbatim: "Individual", price: 23.89, descricao: "A mais gostoso da cidade. Para os loucos por pepino. \n\nA salada de pepino é feita com pepinos frescos e verdinhos. Você pode montar sua salada como quiser. \n\nPode acompanhar picles e queijo branco.", color: .white,  colorButton: Color("DarkGreen"), colorDescricao: Color("Blue"), imagem: "orderAmericana", incrementoUm: "incrementoBurgerUm", incrementoDois: "incrementoBurgerDois", incrementoTres: "incrementoBurgerTres", incrementoQuatro: "incrementoBurgerQuatro", incrementoCinco: "incrementoBurgerCinco")
]

struct VantagensPepino {
    var titulo : String
    var descricao : String
    var imagem : String
    var alertTitulo : String
    var alertDescricao : String
}

var vantagens_cards = [
    VantagensPepino(titulo: "Clube do Pepino", descricao: "Assinatura com experiências únicas.", imagem: "clubePepino", alertTitulo: "Que azar!", alertDescricao: "As vagas exclusivas do Clube do Pepino acabaram."),
    VantagensPepino(titulo: "Pepino Card", descricao: "Para presentear alguém especial.", imagem: "pepinoCard", alertTitulo: "Estoque esgotado!", alertDescricao: "Todos os Pepinos Cards foram resgatados."),
    VantagensPepino(titulo: "Cupom do Pepino", descricao: "Aquele descontão maroto.", imagem: "cupomPepino", alertTitulo: "Acabou tudo!", alertDescricao: "Volte mais tarde."),
    VantagensPepino(titulo: "Ah, que pena!", descricao: "Este cupom expirou 1 minuto atrás.", imagem: "cupomPepino", alertTitulo: "Ah, que pena!", alertDescricao: "Este cupom expirou 1 minuto atrás.")
    

]

struct iFood : View {

    @EnvironmentObject var objMan : ObjectiveManager
    
    @State var last_ordered : [FoodCard] = [food_cards[0], food_cards[1], food_cards[2]]
    
    @State var cupom_alert = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center){
                        HStack{
                            Image(systemName: "house")
                                .foregroundColor(Color("OrangeFood"))
                            Text("Pepino Home, 20")
                                .bold()
                        }
                    }
                    .padding([.top])
                    .font(.footnote)
                    .frame(maxWidth: .infinity)
                    VStack (alignment: .leading) {
                        HStack {
                            Text("30 dias grátis de cupons")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding()
                                .background {
                                    Color.init(uiColor: .orange)
                                        .opacity(0.5)
                                }
                                .cornerRadius(31)
                            Spacer()
                        }

                        Spacer()
                        Text("Você ganhou até $50 em cupons grátis")
                            .foregroundColor(.white)
                            .font(.body)
                            .bold()
                            .frame(width: 200)
                    }

                    .padding()
                    .background {
                        Color("OrangeFood")
                        Image("bannerTexture")
                    }
                    .cornerRadius(12)
                    .padding()
                    .frame(height: 185)
                    .onTapGesture {
                     cupom_alert = true
                    }
                    .alert(isPresented: $cupom_alert) {
                        Alert(
                            title: Text("Ah, que pena!"),
                            message: Text("Este cupom expirou 1 minuto atrás."),
                            dismissButton: .default(Text("OK")) {
                                cupom_alert = false
                            }
                        )
                    }
                    
                    Text("Tipos de cozinha")
                        .font(.body)
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[1])
                            } label: {
                                CardH("Italiana", imagem: "cozinhaItaliana")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[0])
                            } label: {
                                CardH("Brasileira", imagem: "cozinhaBrasileira")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[2])
                            } label: {
                                CardH("Saudável", imagem: "cozinhaSaudavel")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[3])
                            } label: {
                                CardH("Americana", imagem: "cozinhaAmericana")
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Refeições mais pedidas")
                        .font(.body)
                        .bold()
                        .padding()
                    
                    HStack {
                        NavigationLink {
                            iFoodOrderScreen(food: last_ordered[0])
                        } label: {
                            VStack {
                                CardV(food: food_cards[0])
                                    .padding([.leading], 8)
                                    .padding([.top], 10)
                                Spacer()
                            }
                            .background {
                                Image("pepinada")
                            }
                            .frame(width: 170, height: 196)
                            .cornerRadius(8)
                        }
                        Spacer()
                        VStack(spacing: 12) {
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[1])
                            } label: {
                                CardV(food: food_cards[1])
                                    .padding([.leading], -26)
                                    .background {
                                        Image("pizzaPepino")
                                    }
                                    .frame(width: 170, height: 92)
                                    .cornerRadius(8)
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[2])
                            } label: {
                                CardV(food: food_cards[2])
                                    .padding([.leading], -20)
                                    .background {
                                        Image("saladaPepino")
      
                                    }
                                    .frame(width: 170, height: 92)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Lojas")
                        .font(.body)
                        .bold()
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[3])
                        } label: {
                            CardLojas(food: food_cards[3], imagem: "lojaAmericana")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[1])
                        } label: {
                            CardLojas(food: food_cards[1], imagem: "lojaItaliana")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[0])
                        } label: {
                            CardLojas(food: food_cards[0], imagem: "lojaBrasileira")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[2])
                        } label: {
                            CardLojas(food: food_cards[2], imagem: "lojaSaudavel")
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Só tem no iPepino")
                            .font(.body)
                            .bold()
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                CardsVantagens(card: vantagens_cards[0])
                                CardsVantagens(card: vantagens_cards[1])
                                CardsVantagens(card: vantagens_cards[2])
                            }
                            .padding(.horizontal)
                        }
                    }

                }
                .padding(.bottom, 120)
            }
            
            ForEach(Range(1...4), id: \.self) { i in
                let off : CGFloat = CGFloat(i)/10
                FPopUp(image: "pop-up-\(i)", time_to_appear: .now() + off)
            }
        }
    }
}


struct iFood_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let gameManager : GameManager = GameManager()
        let notificationQueue: NotificationQueue = NotificationQueue()
        
        NavigationStack {
            iFood()
                .environmentObject(gameManager)
                .environmentObject(gameManager.objectiveManager)
                .environmentObject(notificationQueue)
                .notificationPresenter(notificationQueue: notificationQueue, gameManager: gameManager)
                .onAppear {
                    gameManager.startDay()
                }
                .statusBar(hidden: true)
        }
        
    }
}
