//
//  SoundManager.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 14/09/23.
//

import SwiftUI
import AVFoundation

class SoundManager : ObservableObject {
    
    @Published private var player : AVAudioPlayer?
    
    public func playSound(_ sound: String, loops: Int) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: nil) else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = loops
            player?.play()
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    public func stopSound() {
        player?.stop()
    }
}

struct Sounda: View {
    
    var sndMan = SoundManager()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                sndMan.playSound("clock01", loops: 0)
            }
    }
}

struct SoundManager_Previews: PreviewProvider {
    static var previews: some View {
        Sounda()
    }
}
