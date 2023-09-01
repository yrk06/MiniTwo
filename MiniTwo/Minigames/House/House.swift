//
//  House.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 31/08/23.
//

import SwiftUI

struct House: View {
    var body: some View {
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
    }
}

struct House_Previews: PreviewProvider {
    static var previews: some View {
        House()
    }
}
