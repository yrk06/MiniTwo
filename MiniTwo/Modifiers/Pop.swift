//
//  Pop.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 28/08/23.
//

import SwiftUI

struct Pop: ViewModifier {
    @State var resize = true
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(resize ? 0 : 1)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25)
                {
                    withAnimation(.spring()) {
                        resize = false
                    }
                }
            }
    }
}

extension View {
    func PopU() -> some View {
        modifier(Pop())
    }
}
