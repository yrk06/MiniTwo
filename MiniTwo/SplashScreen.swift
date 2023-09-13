//
//  SplashScreen.swift
//  MiniTwo
//
//  Created by Julia Bettuz on 11/09/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack {
            Color("Green")
                .edgesIgnoringSafeArea(.all)
            
            Image("LogoPepino")
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
