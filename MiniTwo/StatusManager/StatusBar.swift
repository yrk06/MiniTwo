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
                .foregroundColor(Color(uiColor: .darkGray))
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
        HStack (alignment: .center, spacing: 42) {
            Button {
                NavigationUtil.popToRootView()
            } label: {
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
                    .padding(4)
                    .padding(.horizontal, 8)
                    .background(Color(uiColor: .darkGray))
                    .cornerRadius(8)
                    .padding(6)
            }
            
            StatusItem(stsMan.getHealth(), "heart.fill", 0.34, .white)
            StatusItem(stsMan.getHunger(), "fork.knife", 0.42, .white)
            StatusItem(stsMan.getMoney(), "dollarsign", 0.42, .white)
        }
        .foregroundColor(.white)
        .padding()
        .background {
            Color.black
        }
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(8)
    }
}

struct StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        StatusBar()
    }
}
