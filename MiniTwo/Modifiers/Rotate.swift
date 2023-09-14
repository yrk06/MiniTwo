//
//  Rotate.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 05/09/23.
//

import SwiftUI

struct Rotate: ViewModifier {
    @State var rotate_left : Double = 1
    @Binding var angle_holder : Double
    
    func body(content: Content) -> some View {
        content
            .onChange(of: angle_holder, perform: { newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    if angle_holder <= -135
                    {
                        rotate_left = 1
                    }
                    else if angle_holder >= 135
                    {
                        rotate_left = -1
                    }
                    angle_holder += rotate_left * 3
                }
            })
            .rotationEffect(Angle(degrees: angle_holder))
            .onAppear {
                angle_holder = 0
            }
    }
}

extension View {
    func Oscilate(_ angle_holder: Binding<Double>) -> some View {
        modifier(Rotate(angle_holder: angle_holder))
    }
}
