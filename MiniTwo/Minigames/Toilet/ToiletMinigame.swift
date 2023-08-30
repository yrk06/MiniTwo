//
//  ToiletMinigame.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import SwiftUI

struct ToiletMinigame: View {
    @State var toiletState: Int = 0
    @State var motionManager: MotionManager?
    var body: some View {
        VStack {
            Text("\(toiletState)")
                .onAppear {
                    if motionManager == nil {
                        motionManager = MotionManager(state: $toiletState)
                    }
                }
            Group {
                Rectangle()
                    .fill(.brown)
                    .frame(maxWidth: 20, maxHeight: 200)
                Circle()
                    .fill(.red)
                    .frame(maxWidth: 60)
                    .padding(.bottom,-30)
                    .clipped()
                    .padding(.top,-20)
            }
            .offset(x:0, y: toiletState % 2 == 0 ? 0 : -60)
            .transition(.slide)
            .animation(.easeInOut(duration: 0.5), value: toiletState)
        }
        
    }
}

struct ToiletMinigame_Previews: PreviewProvider {
    static var previews: some View {
        ToiletMinigame()
    }
}
