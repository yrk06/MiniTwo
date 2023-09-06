//
//  StatusBar.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 06/09/23.
//

import SwiftUI

struct StatusItem: View {
    
    var value : Double
    var imageName : String
    var frameConst : Double
    var color : Color
    
    init(_ value: Double, _ imageName: String, _ frameConst : Double, _ color : Color) {
        self.value = value
        self.imageName = imageName
        self.frameConst = frameConst
        self.color = color
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Image(systemName: imageName)
                .foregroundColor(.gray)
            Image(systemName: imageName)
                .foregroundColor(color)
                .frame(height: value * frameConst, alignment: .bottom)
                .clipped()
        }
    }
}

struct StatusBar: View {
    
    @EnvironmentObject var stsMan : StatusManager
    
    var body: some View {
        HStack (alignment: .center, spacing: 32) {
            Button {
                NavigationUtil.popToRootView()
            } label: {
                Image(systemName: "house.fill")
                    .foregroundColor(.blue)
                    .padding(4)
                    .padding(.horizontal, 8)
                    .background(.blue.opacity(0.25))
                    .cornerRadius(40)
                    .padding(.trailing, 12)
            }
            .padding(.trailing)
            
            StatusItem(stsMan.getHealth(), "heart.fill", 0.34, .red)
            StatusItem(stsMan.getHunger(), "fork.knife", 0.42, .orange)
            StatusItem(stsMan.getMoney(), "dollarsign", 0.42, .indigo)
        }
        .foregroundColor(.white)
        .padding()
        .background (.ultraThinMaterial)
        .cornerRadius(80)
        .shadow(radius: 10)
        .padding(16)
    }
}

struct StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        StatusBar()
    }
}
