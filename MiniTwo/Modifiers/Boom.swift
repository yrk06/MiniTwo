//
//  Boom.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 14/09/23.
//

import SwiftUI

struct BoomU: ViewModifier {
    @State var resize = true
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(resize ? 1.1 : 0.8)
            .onAppear {
                resize = false
            }
            .onChange(of: resize) { newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25)
                {
                    withAnimation(.spring()) {
                        resize = !resize
                    }
                }
            }
    }
}

extension View {
    func Boom() -> some View {
        modifier(BoomU())
    }
}

struct Boom_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
            .Boom()
    }
}
