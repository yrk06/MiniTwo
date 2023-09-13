//
//  iFoodPopUps.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 29/08/23.
//

import SwiftUI

var phrasesFood : [String: String] = [
    "Comida fresca e saborosa!" : "Garantimos que cada refeição é preparada com ingredientes frescos e amor. Delicie-se com o sabor autêntico.",
    "Pedidos com toque de chefe" : "Deixe nossos chefs surpreenderem você! Faça um pedido e receba uma criação única diretamente da cozinha.",
    "Comemore com a gente!" : "Tem um aniversário ou ocasião especial? Deixe-nos tornar a celebração mais saborosa com nossos pratos exclusivos.",
    "Fique por dentro das promoções!" : "Inscreva-se nas nossas notificações para receber as melhores ofertas e descontos em primeira mão. Não perca as próximas promoções!",
    "Restaurante em destaque!" : "Experimente o restaurante em destaque desta semana e desfrute de uma refeição excepcional. Reserve uma mesa agora!"
]

struct FPopUp: View {
    
    var image : String
    
    @State var x : CGFloat = CGFloat.random(in: -90...90)
    @State var y : CGFloat = CGFloat.random(in: -200...100)

    @State var active = false
    var time_to_appear : DispatchTime = .now() + 0
    
    var body: some View {
        VStack(alignment: .leading) {
            if (active) {
                ZStack {
                    
                    Image(image)
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation {
                                active = false
                            }
                        }
                        .padding([.bottom], 260)
                        .padding([.leading], 180)
                }
                .shadow(radius: 10, x: 5, y: 5)
                .offset(x: x, y: y)
                .PopU()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: time_to_appear) {
                active = true
            }
            
        }
    }
}
