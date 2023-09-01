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
    
    @EnvironmentObject var objectiveManager: ObjectiveManager
    @Environment(\.dismiss) var dismiss
    
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
        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    // up
                                    if toiletState % 2 == 0 {
                                        toiletState += 1
                                    }
                                }

                                if value.translation.height > 0 {
                                    if toiletState % 2 == 1 {
                                        toiletState += 1
                                    }
                                }
                            }))
        .onChange(of: toiletState, perform: {
            value in
            if value >= 20 {
                objectiveManager.complete_mission(type: .privada)
                dismiss()
            }
        })
        
    }
}

struct ToiletMinigame_Previews: PreviewProvider {
    static var previews: some View {
        ToiletMinigame()
    }
}
