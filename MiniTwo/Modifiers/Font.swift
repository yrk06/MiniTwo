//
//  Font.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 06/09/23.
//

import Foundation
import SwiftUI

extension View {
    func fontBob(size: CGFloat) -> some View {
        return self.font(.custom("MyFontRegular", size: size))
    }
}
