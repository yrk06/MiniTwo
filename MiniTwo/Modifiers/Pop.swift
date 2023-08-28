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
            .scaleEffect(1.2)
            .onAppear {
                stop()
        }
    }
    
    private func stop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 1)) {
                resize = false
            }
        }
    }
}

extension View {
    func changeSize() -> some View {
        modifier(Pop())
    }
}
