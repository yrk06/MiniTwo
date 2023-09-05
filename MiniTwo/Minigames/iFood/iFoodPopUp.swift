//
//  iFoodPopUps.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 29/08/23.
//

import SwiftUI

struct FPopUp: View {
    
    var text : String = "Placeholder"
    
    @State var x : CGFloat = CGFloat.random(in: -150...150)
    @State var y : CGFloat = CGFloat.random(in: -200...200)
    
    @State var active = false
    var time_to_appear : DispatchTime = .now() + 0
    
    var body: some View {
        VStack {
            if (active) {
                VStack(spacing: 8) {
                    Text(text)
                    Image(systemName: "x.circle.fill")
                        .onTapGesture {
                            withAnimation {
                                active = false
                            }
                        }
                }
                .padding()
                .background {
                    Color.white
                }
                .cornerRadius(8)
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
