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
                    .stroke(.gray, lineWidth: 1)
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
}

var food_cards = [
    FoodCard(nome: "Pepinada", nome_restaurante: "Casa do Pepino", tipo_cozinha: "Brasileira", verbatim: "Prato tipicamente brasileiro, delicioso com um toque refrescante.", price: 65.99),
    FoodCard(nome: "Pizza de pepino", nome_restaurante: "Pepino's Pizza", tipo_cozinha: "Italiana", verbatim: "Individual", price: 54.99),
    FoodCard(nome: "Salada de pepino", nome_restaurante: "PepinoWay", tipo_cozinha: "Saudável", verbatim: "Individual", price: 15.99),
    FoodCard(nome: "Hamburger de pepino", nome_restaurante: "Pepino Donald's", tipo_cozinha: "Americana", verbatim: "Também do Siri Cascudo", price: 23.89)
]

struct VantagensPepino {
    var titulo : String
    var descricao : String
    var imagem : String
    var alertTitulo : String
    var alertDescricao : String
}

var vantagens_cards = [
    VantagensPepino(titulo: "Clube do Pepino", descricao: "Assinatura com experiências únicas", imagem: "clubePepino", alertTitulo: "Que azar!", alertDescricao: "As vagas exclusivas do Clube do Pepino acabaram."),
    VantagensPepino(titulo: "Pepino Card", descricao: "Para presentear alguém especial", imagem: "pepinoCard", alertTitulo: "Estoque esgotado!", alertDescricao: "Todos os Pepinos Cards foram resgatados."),
    VantagensPepino(titulo: "Cupom do Pepino", descricao: "Aquele descontão maroto", imagem: "cupomPepino", alertTitulo: "Acabou tudo!", alertDescricao: "Volte mais tarde.")

]

struct iFood : View {

    @EnvironmentObject var objMan : ObjectiveManager
    
    @State var last_ordered : [FoodCard] = [food_cards[0], food_cards[1], food_cards[2]]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack (alignment: .leading) {
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
                    }
                    .cornerRadius(12)
                    .padding()
                    .frame(height: 225)
                    
                    Text("Tipos de cozinha")
                        .font(.body)
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[1], last_ordered: $last_ordered)
                            } label: {
                                CardH("Italiana", imagem: "cozinhaItaliana")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[0], last_ordered: $last_ordered)
                            } label: {
                                CardH("Brasileira", imagem: "cozinhaBrasileira")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[2], last_ordered: $last_ordered)
                            } label: {
                                CardH("Saudável", imagem: "cozinhaSaudavel")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[3], last_ordered: $last_ordered)
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
                            iFoodOrderScreen(food: last_ordered[0], last_ordered: $last_ordered)
                        } label: {
                            VStack {
                                CardV(food: last_ordered[0])
                                    .padding([.leading], -8)
                                Spacer()
                            }
                            .padding()
                            .background {
                                Image("pepinada")
                            }
                            .frame(width: 170, height: 196)
                            .cornerRadius(8)
                        }
                        Spacer()
                        VStack(spacing: 12) {
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[1], last_ordered: $last_ordered)
                            } label: {
                                CardV(food: last_ordered[1])
                                    .padding([.leading], -36)
                                    .background {
                                        Image("pizzaPepino")
                                    }
                                    .frame(width: 170, height: 92)
                                    .cornerRadius(8)
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[2], last_ordered: $last_ordered)
                            } label: {
                                CardV(food: last_ordered[2])
                                    .padding([.leading], -28)
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
                            iFoodOrderScreen(food: food_cards[3], last_ordered: $last_ordered)
                        } label: {
                            CardLojas(food: food_cards[3], imagem: "lojaAmericana")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[1], last_ordered: $last_ordered)
                        } label: {
                            CardLojas(food: food_cards[1], imagem: "lojaItaliana")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[0], last_ordered: $last_ordered)
                        } label: {
                            CardLojas(food: food_cards[0], imagem: "lojaBrasileira")
                        }
                        NavigationLink {
                            iFoodOrderScreen(food: food_cards[2], last_ordered: $last_ordered)
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
            }
            
//            ForEach(Range(1...5), id: \.self) { i in
//                let off : CGFloat = CGFloat(i)/10
//                FPopUp(text: phrases["Você merece!"]!, time_to_appear: .now() + off)
//            }
        }
    }
}


struct iFood_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let gameManager : GameManager = GameManager()
        let notificationQueue: NotificationQueue = NotificationQueue()
        
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
