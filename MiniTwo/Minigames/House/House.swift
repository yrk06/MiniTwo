//
//  House.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI

struct House: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                
                NavigationLink {
                    RoomCleaningMinigame()
                } label: {
                    Text("Limpar a casa")
                }
                
                NavigationLink {
                    ToiletMinigame()
                } label: {
                    Text("Desentupir a privada")
                }
                
                NavigationLink {
                    Panela()
                } label: {
                    Text("Cozinhar pepinada")
                }
            }
        }
    }
}

struct House_Previews: PreviewProvider {
    static var previews: some View {
        House()
    }
}
