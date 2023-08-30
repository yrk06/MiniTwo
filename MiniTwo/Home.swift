//
//  Home.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @State var place : Int8 = 0
    
    var body: some View {
        NavigationStack {
            ObjectiveView()
            NavigationLink("iFood") {
                iFood()
            }
            NavigationLink("Bank") {
                Bank()
            }
        }
        .onAppear {
            objMan.fill_objectives(n: 5)
        }
    }
}
