//
//  iFoodOrderScreen.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 01/09/23.
//

import SwiftUI

struct iFoodOrderScreen: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @EnvironmentObject var stsMan : StatusManager
    @Environment(\.dismiss) var dismiss
    
    var food : FoodCard = FoodCard(nome: "Test", nome_restaurante: "Pizza de Pepino", tipo_cozinha: "Italiana", verbatim: "Verbatim", price: 10, descricao: "O verdadeiro suculento. \n\nPara os loucos por pepino.Pizza de pepino com mussarela de búfala regada por molho de tomates caseiro e coberto queijo mussarela. \n\nAcompanha picles.", color: Color("Blue"), colorButton: Color("DarkGreen"), colorDescricao: .white, imagem: "orderItaliana", incrementoUm: "incrementoPizzaUm", incrementoDois: "incrementoPizzaDois", incrementoTres: "incrementoPizzaTres", incrementoQuatro: "incrementoPizzaQuatro", incrementoCinco: "incrementoPizzaCinco")
    var name : String = "Muda Pizza"
    var restaurantName : String = "Giorno's Pizza"
    var description : String = "This is a placeholder description.\nLook at how it can support Markdown!!"
    
    var valorIncrementos : [Float] = [1.5, 2, 6, 10, 100]
    
    @State var price : Float = 10
    
    init(food: FoodCard) {
        self.food = food
        self.price = price
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Image(food.imagem)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text(food.nome_restaurante)
                        .font(.title)
                        .bold()
                        .foregroundColor(food.colorDescricao)
                    Spacer()
                    Image(systemName: "star.fill")
                    Text("5,0")
                        .font(.callout)
                        .foregroundColor(food.colorDescricao)
                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, 4)
                .foregroundColor(.white)
                
                Text(food.descricao)
                    .font(.footnote)
                    .padding()
                    .foregroundColor(food.colorDescricao)
                
                Text("R$ \(String(format: "%.2f", price))")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(food.colorDescricao)
                
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "basket")
                        Text(food.nome_restaurante)
                        Spacer()
                        Image(systemName: "star.fill")
                        Text("5,0")
                    }
                    .foregroundColor(food.colorDescricao)
                    
                    Divider()
                        .background(Color.white.opacity(0.6))
                    HStack {
                        Text("30-40min •")
                        Text("Grátis")
                    }
                    .foregroundColor(food.colorDescricao)
                    .font(.caption2)
                }
                .font(.caption2)
                .padding()
                .background(food.colorDescricao.opacity(0.1))
                .cornerRadius(12)
                .padding()
                
                Divider()
                    .background(Color.white.opacity(0.6))
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Incremente seu pedido")
                            .font(.body)
                            .bold()
                            .foregroundColor(food.colorDescricao)
                        Spacer()
                        Button(action: { price = food.price }, label: {
                            Text("Limpar")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(food.colorDescricao)
                        })
                    }
                    .padding([.trailing])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Button(action: {price += valorIncrementos[0]}, label: {
                                VStack{
                                    Image(food.incrementoUm)
                                    Text("Ketchup")
                                        .font(.caption)
                                }
                            })
                            Button(action: {price += valorIncrementos[1]}, label: {
                                VStack{
                                    Image(food.incrementoDois)
                                    Text("Mostarda")
                                        .font(.caption)
                                }
                            })
                            Button(action: {price += valorIncrementos[2]}, label: {
                                VStack{
                                    Image(food.incrementoTres)
                                    Text("Pepperoni")
                                        .font(.caption)
                                }
                            })
                            Button(action: {price += valorIncrementos[3]}, label: {
                                VStack{
                                    Image(food.incrementoQuatro)
                                    Text("Queijo")
                                        .font(.caption)
                                }
                            })
                            Button(action: {price += valorIncrementos[4]}, label: {
                                VStack{
                                    Image(food.incrementoCinco)
                                    Text("Pepino")
                                        .font(.caption)
                                }
                            })
                        }
                        .foregroundColor(food.colorDescricao)
                    }
                }
                .padding([.top])
                .padding([.bottom])
                .padding([.leading])
                
                
                Button {
                    objMan.complete_mission(type: .comer)
                    stsMan.changeHunger(by: 10)
                    stsMan.changeMoney(by: -Double(food.price.nextUp))
                    dismiss()
                } label: {
                    Text("Comprar")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(food.colorButton)
                        .cornerRadius(12)
                        .padding()
                    
                }
                //        .edgesIgnoringSafeArea(.bottom)
            }
        }
            .background(food.color)
        
        
    }
}

struct iFoodOrder_Preview: PreviewProvider {
    
    static var previews: some View {
        
        let gameManager : GameManager = GameManager()
        let notificationQueue: NotificationQueue = NotificationQueue()
        @State var lastOrdered : [FoodCard] = []
        
        iFoodOrderScreen(food: FoodCard(nome: "Test", nome_restaurante: "Pizza de Pepino", tipo_cozinha: "Italiana", verbatim: "Verbatim", price: 10, descricao: "O verdadeiro suculento. \n\nPara os loucos por pepino.Pizza de pepino com mussarela de búfala regada por molho de tomates caseiro e coberto queijo mussarela. \n\nAcompanha picles.", color: Color("Blue"), colorButton: Color("DarkGreen"), colorDescricao: .white, imagem: "orderItaliana", incrementoUm: "incrementoPizzaUm", incrementoDois: "incrementoPizzaDois", incrementoTres: "incrementoPizzaTres", incrementoQuatro: "incrementoPizzaQuatro", incrementoCinco: "incrementoPizzaCinco"))
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
