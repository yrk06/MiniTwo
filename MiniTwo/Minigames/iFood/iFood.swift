//
//  iFood.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 29/08/23.
//

import SwiftUI

struct CardH : View {
    
    var verbatim : String
    
    init(_ verbatim: String) {
        self.verbatim = verbatim
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text(verbatim)
                .font(.caption2)
                .padding()
                .frame(width: 100)
        }
        .frame(width: 100, height: 100)
        .background {
            HStack {
                Color.gray
                    .opacity(0.2)
            }
        }
        .cornerRadius(8)
        .foregroundColor(.black)
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
                .font(.footnote)
                .bold()
                .padding(.bottom, 2)
            Text(food.verbatim)
                .font(.caption2)
                .padding(.bottom, 4)
                .frame(alignment: .leading)
            Text("R$\(String(format: "%.2f", food.price))")
                .font(.caption2)
        }
        .foregroundColor(.black)
    }
}

struct FoodCard {
    var nome : String
    var nome_restaurante : String
    var verbatim : String
    var price : Float
}

var food_cards = [
    FoodCard(nome: "Pepinada", nome_restaurante: "Casa do Pepino", verbatim: "Delicioso prato tipicamente brasileiro com um toque refrescante", price: 15.99),
    FoodCard(nome: "Pizza de Pepino", nome_restaurante: "Pepino's Pizza", verbatim: "Para os loucos por pepino", price: 25.99),
    FoodCard(nome: "Sanduíche de pepino", nome_restaurante: "PepinoWay", verbatim: "Do siri cascudo", price: 15.99),
    FoodCard(nome: "Hamburger de pepino", nome_restaurante: "Pepino Donald's", verbatim: "Também do Siri Cascudo", price: 15.99)
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
                                CardH("Italiana")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[0], last_ordered: $last_ordered)
                            } label: {
                                CardH("Brasileira")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[2], last_ordered: $last_ordered)
                            } label: {
                                CardH("Saudável")
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: food_cards[3], last_ordered: $last_ordered)
                            } label: {
                                CardH("Americana")
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Suas últimas refeições")
                        .font(.body)
                        .bold()
                        .padding()
                    
                    HStack {
                        NavigationLink {
                            iFoodOrderScreen(food: last_ordered[0], last_ordered: $last_ordered)
                        } label: {
                            VStack {
                                CardV(food: last_ordered[0])
                                Spacer()
                            }
                            .padding()
                            .background {
                                Color.gray
                                    .opacity(0.2)
                            }
                            .cornerRadius(8)
                        }
                        VStack {
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[1], last_ordered: $last_ordered)
                            } label: {
                                CardV(food: last_ordered[1])
                                    .padding()
                                    .background {
                                        Color.gray
                                            .opacity(0.2)
                                    }
                                    .cornerRadius(8)
                            }
                            NavigationLink {
                                iFoodOrderScreen(food: last_ordered[2], last_ordered: $last_ordered)
                            } label: {
                                CardV(food: last_ordered[2])
                                    .padding()
                                    .background {
                                        Color.gray
                                            .opacity(0.2)
                                    }
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .frame(height: 195)
                    .padding(.horizontal)
                    
                }
            }
            
            ForEach(Range(1...5), id: \.self) { i in
                let off : CGFloat = CGFloat(i)/10
                FPopUp(text: phrases["Você merece!"]!, time_to_appear: .now() + off)
            }
        }
    }
}
