//
//  PopUpSystem.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

struct PopUp : View {
    
    var text : String!
    
    @Binding var op_1 : Bool
    @Binding var op_2 : Bool
    
    @State var pop_up_done : Bool = false
    
    var reversed : Int8 = Int8.random(in: 1...10)
    
    var body: some View {
        if (!pop_up_done)
        {
            VStack {
                Text(text)
                
                Button {
                    if (reversed == 1) {
                        op_1 = true
                    } else {
                        op_2 = true
                    }
                    withAnimation(.spring()) {
                        pop_up_done = true
                    }
                } label: {
                    if (reversed == 1) {
                        Text("No")
                    } else {
                        Text("Yes")
                    }
                }
                
                Button {
                    if (reversed == 1) {
                        op_2 = true
                    } else {
                        op_1 = true
                    }
                    withAnimation(.spring()) {
                        pop_up_done = true
                    }
                } label: {
                    if (reversed == 1) {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                }
                
            }
            .padding()
            .background
            {
                Color.purple
            }
            .cornerRadius(5)
            .PopU()
        }
    }
}
