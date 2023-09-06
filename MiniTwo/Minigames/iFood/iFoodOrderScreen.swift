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
    
    var food : FoodCard!
    var name : String = "Muda Pizza"
    var restaurantName : String = "Giorno's Pizza"
    var description : String = "This is a placeholder description.\nLook at how it can support Markdown!!"
    
    @Binding var last_ordered : [FoodCard]
    
    var body: some View {
        VStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.blue)
            HStack {
                Text(food.nome_restaurante)
                    .font(.title)
                    .bold()
                Spacer()
                Image(systemName: "star.fill")
                Text("5,0")
                    .font(.callout)
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 4)
            
            Text(food.verbatim)
                .font(.footnote)
                .padding()
            
            Text("R$ \(String(format: "%.2f", food.price))")
                .font(.title3)
                .bold()
                .padding(.horizontal)
            
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "basket")
                    Text(food.nome_restaurante)
                    Spacer()
                    Image(systemName: "star.fill")
                    Text("5,0")
                }
                Divider()
                HStack {
                    Text("30-40min •")
                    Text("Grátis")
                        .foregroundColor(.red)
                }
                .font(.caption2)
            }
            .font(.caption2)
            .padding()
            .background()
            .cornerRadius(12)
            .padding()
            .shadow(radius: 5)
//            .border(Color.black.opacity(0.2))
            
            Divider()
                .padding(.horizontal)
            
            Button {
                objMan.complete_mission(type: .comer)
                stsMan.changeHunger(by: 10)
                stsMan.changeMoney(by: -Double(food.price.nextUp))
                last_ordered.insert(food, at: 0)
                last_ordered.remove(at: 3)
                dismiss()
            } label: {
                Text("Comprar \(food.nome)")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        Color("OrangeFood")
                    }
                    .cornerRadius(12)
                    .padding()
            }

        }
    }
}
