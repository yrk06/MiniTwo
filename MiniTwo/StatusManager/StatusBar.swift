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
    var name : String
    
    init(_ value: Double, _ imageName: String, _ frameConst : Double, _ color : Color, _ name: String) {
        self.value = value
        self.imageName = imageName
        self.frameConst = frameConst
        self.color = color
        self.name = name
    }
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Image(systemName: imageName)
                    .foregroundColor(Color(uiColor: .darkGray))
                    .font(.title)
                Image(systemName: imageName)
                    .foregroundColor(value > 40 ? (color) : (.red))
                    .font(.title)
                    .frame(height: value * frameConst, alignment: .bottom)
                    .clipped()
            }
            Text(name)
                .font(.caption2)
                .foregroundColor(.gray)
                .frame(width: 60)
        }
    }
}

struct StatusBar: View {
    
    @EnvironmentObject var stsMan : StatusManager
    
    var body: some View {
        VStack {
            ForEach(0..<stsMan.getLog().count, id: \.self) { i in
                if stsMan.getLog().count > 0 {
                    Text(stsMan.getLog()[i])
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding()
                        .background {
                            Color("GrayBackItems")
                                .opacity(0.75)
                        }
                        .cornerRadius(12)
                        .transition(.scale)
                }
            }
            HStack (alignment: .center, spacing: 30) {
                Button {
                    NavigationUtil.popToRootView()
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .padding(4)
                        .padding(.horizontal, 8)
                        .background(Color(uiColor: .darkGray))
                        .cornerRadius(8)
                }
                
                StatusItem(stsMan.getHealth(), "heart.fill", /*0.34*/0.3, .white, "bem-estar")
                StatusItem(stsMan.getHunger(), "fork.knife", 0.38, .white, "fome")
                StatusItem(stsMan.getMoney(), "dollarsign", 0.42, .white, "dinheiro")
            }
            .foregroundColor(.white)
            .padding()
            .background {
                Color.black
            }
            .cornerRadius(16)
            .shadow(radius: 10)
            .padding(8)
            .onAppear {
                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { i in
                    if stsMan.getLog().count > 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            stsMan.removeFirst()
                        }
                    }
                }
            }
        }
    }
}

struct StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        StatusBar()
    }
}
