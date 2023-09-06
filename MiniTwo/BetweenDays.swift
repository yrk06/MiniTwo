//
//  BetweenDays.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 06/09/23.
//

import SwiftUI

struct BetweenDays: View {
    
    let day: Int
    
    let cont: (()->Void)?
    
    var body: some View {
        VStack {
            Image("dia\(day)")
            Text("Dia concluído")
                .fontBob(size: 28)
                .foregroundColor(.white)
                .padding(.bottom,28)
            Text("Parabéns, você venceu um dia como adulto!\n\nQue pena seria se amanhã você tivesse que fazer tudo de novo. E de novo. E de novo...")
                .frame(width: 213)
                .multilineTextAlignment(.center)
            Button("Continuar") {
                cont?()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            
            .cornerRadius(200)
            .padding()
        }
        .foregroundColor(.white)
        .TextBackground(palavra: "Parabens")
        .background(Color("Green"))
        
    }
}

struct BetweenDays_Previews: PreviewProvider {
    static var previews: some View {
        BetweenDays(day: 1, cont: nil)
    }
}
