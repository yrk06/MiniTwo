//
//  NotificationTypes.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 27/08/23.
//

import Foundation
import SwiftUI
import CoreHaptics

protocol Notification: Identifiable {
    var id: UUID { get }
    var dismissed: Bool {get set}
    var timeToDismiss: Int {get}
    var dismiss: (() -> Void)? {get set}
    @ViewBuilder func getScreenView() -> any View
    @ViewBuilder func getListView() -> any View
}

struct EmptyNotification: Notification {
    var dismiss: (() -> Void)?
    
    var dismissed: Bool = true
    var timeToDismiss: Int = 0
    
    func getScreenView() -> any View {
        EmptyView()
    }
    
    func getListView() -> any View {
        EmptyView()
    }
    
    var id: UUID = UUID()
}

struct TextNotification: Notification {
    var dismiss: (() -> Void)?
    
    
    var id: UUID = UUID()
    var dismissed: Bool = false
    var timeToDismiss: Int = 3
    
    var icon: String = "creditcard"
    var text: String = "Compra aprovada"
    
    
    @ViewBuilder func getScreenView() -> any View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
                .cornerRadius(8)
            Text(text)
        }
        .frame(maxHeight: 72)
        
    }
    
    @ViewBuilder func getListView() -> any View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
                .cornerRadius(8)
            Text(text)
        }
        .frame(maxHeight: 72)
    }
    
    
}

struct CallNotificationView: View {
    
    @State var answered: Bool = false
    var caller: String = ""
    var dismiss: (() -> Void)?
    
    @State var animationLock = false
    @State var rng = Int.random(in: 0...5)
    
    @State var player : CHHapticAdvancedPatternPlayer?
    
    var body: some View {
        Group {
            if !answered {
                HStack (spacing: 6){
                    VStack (alignment: .leading) {
                        Text(caller)
                            .bold()
                        Text("mobile")
                    }
                    
                    Spacer()
                    
                    if rng != 0 {
                        Button {
                            do {
                                try player?.stop(atTime: CHHapticTimeImmediate)
                            } catch {
                                print("Failed to stop haptic \(error.localizedDescription)")
                            }
                            dismiss!()
                        } label: {
                            Image(systemName: "phone.down.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 32, maxHeight: 32)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.red)
                                .cornerRadius(64)
                        }
                        Spacer()
                        
                        Button {
                            withAnimation {
                                answered = true
                            }
                        } label: {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 32, maxHeight: 32)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.green)
                                .cornerRadius(64)
                        }
                    } else {
                        
                        
                        
                        Button {
                            withAnimation {
                                answered = true
                            }
                        } label: {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 32, maxHeight: 32)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.green)
                                .cornerRadius(64)
                        }
                        Spacer()
                        Button {
                            dismiss!()
                        } label: {
                            Image(systemName: "phone.down.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 32, maxHeight: 32)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.red)
                                .cornerRadius(64)
                        }
                    }
                    
                    
                }
                .rotationEffect(animationLock ? Angle(degrees: -5) : Angle(degrees: 5))
                .animation(.easeInOut(duration: 0.1).repeatForever(autoreverses: true), value: animationLock)
                .frame(maxWidth: .infinity, maxHeight: 72)
                .padding(.horizontal, 32)
                .padding(.bottom, 8)
                .background(.ultraThinMaterial)
                .onAppear {
                    withAnimation {
                        animationLock = true
                    }
                    
                }
                } else {
                    VStack {
                        
                        Text(caller)
                            .font(.title)
                            .bold()
                        Spacer()
                        HStack {
                            Button {
                                dismiss!()
                            } label: {
                                Image(systemName: "phone.down.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 64, maxHeight: 64)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(64)
                            }
                        }
                        
                        
                    }
                    .padding(.vertical, 64)
                    .transition(.opacity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
            }
        }
        .onAppear {
            
            let events = [
                CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0.2),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 0.4),
                    CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 0.6, duration: 0.5),
                    CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 1.2, duration: 0.5),
                    CHHapticEvent(eventType: .hapticContinuous, parameters: [], relativeTime: 1.8, duration: 0.5),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 2.4),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 2.6),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [], relativeTime: 2.8)
                    ]

                // convert those events into a pattern and play it immediately
                do {
                    let pattern = try CHHapticPattern(events: events, parameters: [])
                    player = try HapticsManager.shared.engine?.makeAdvancedPlayer(with: pattern)
                    player?.loopEnabled = true
                    try player?.start(atTime: CHHapticTimeImmediate)
                    
                } catch {
                    print("Failed to play pattern: \(error.localizedDescription).")
                }
        }
        .onChange(of: answered, perform: {
            _ in
            do {
                try player?.stop(atTime: CHHapticTimeImmediate)
            } catch {
                print("Failed to stop haptic \(error.localizedDescription)")
            }
        })
        
    }
    
}

struct CallNotification: Notification {
    var id: UUID = UUID()
    
    var dismissed: Bool = false
    
    var timeToDismiss: Int = 0
    
    var dismiss: (() -> Void)?
    
    var caller: String = "0303 0800 9001"
    
    
    
    func getScreenView() -> any View {
        CallNotificationView(caller: caller, dismiss: {
            dismiss?()
        })
    }
    
    func getListView() -> any View {
        EmptyView()
    }
    
    
}


struct NotificationScreenView_Preview: PreviewProvider {
    static var previews: some View {
        AnyView(TextNotification().getScreenView())
    }
}

struct NotificationCall_Previews: PreviewProvider {
    
    static var previews: some View {
        let notificationQueue = NotificationQueue()
        VStack {
            Text("Hello World")
            Button("Call me maybe")
            {
                notificationQueue.push(CallNotification(caller: "MIM DE AUUUUUUUUUU"))
            }
        }
        .notificationPresenter(notificationQueue: notificationQueue)
    }
}
