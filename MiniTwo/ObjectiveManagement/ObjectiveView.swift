//
//  ObjectivesView.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct ObjectiveView: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @State var maximized : Bool = true
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(objMan.allObjectives) { i in
                HStack {
                    if i.done {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "x.circle")
                            .foregroundColor(.red)
                    }
                    Text("\(i.objective.rawValue)")
                        .padding(.bottom, 2)
                }
            }
        }
        .padding()
        .background()
        .cornerRadius(8)
        .shadow(radius: 10, x: 0, y: 5)
    }
}
