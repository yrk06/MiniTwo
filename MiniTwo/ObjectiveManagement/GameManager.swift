//
//  GameManager.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 04/09/23.
//

import Foundation
import SwiftUI

enum stat {
    case health, money, energy
}

class GameManager: ObservableObject {
    
    @Published var day: Int = 0
    @Published var dayTick = 90
    @Published var dayTransition = false
    @Published var gameEnded : Bool = false
    @Published var gameWon : Bool = false
    
    @Published var isFirstTime: [Bool] = [true, true, true, true, true]
    
    func firstTime(_ idx: Int) -> Binding<Bool> {
        return Binding(get: {self.isFirstTime[idx]}, set: { v in
            self.isFirstTime[idx] = v
        })
    }
    
    var dayTimer: Timer?
    
    var objectiveManager: ObjectiveManager = ObjectiveManager()

    var statusManager: StatusManager = StatusManager()
    
    var sndMan : SoundManager = SoundManager()
    
    func getTaskCount() -> Int {
        switch day {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 5
        case 3:
            return 7
        case 4:
            return 9
        case 5:
            return 9
        case 6:
            return 11
        default:
            return 11
        }
    }
    
    func startDay() {
        dayTransition = false
        let count = Int8(getTaskCount())
        
        objectiveManager.fill_objectives(n: count)
//        objectiveManager.add_objective(.limpar)
//        objectiveManager.add_objective(.limpar)
        
        self.statusManager.changeMoney(by: 50)
        
        dayTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
                _ in
            self.dayTick -= 1
            if !self.dayTransition && !self.gameEnded {
                self.statusManager.changeHunger(by: -1.5)
            }
            if self.dayTick == 0 {
                self.dayTimer?.invalidate()
                self.endDay()
            }
            if self.objectiveManager.allObjectives.count == 0
            {
                self.dayTimer?.invalidate()
                self.endDay()
            }
            if self.statusManager.getHealth() <= 1 {
                self.loseGame()
            } else if self.statusManager.getMoney() <= 1 {
                self.loseGame()
            } else if self.statusManager.getHunger() <= 1 {
                self.loseGame()
            }
//            print(self.statusManager.getHunger())
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                if self.dayTick % 2 == 0 {
                    self.sndMan.playSound("clock01.wav", loops: 0)
                } else {
                    self.sndMan.playSound("clock02.wav", loops: 0)
                }
            }
        })
    }
    
    func endDay() {
//        withAnimation(.easeInOut) {
            dayTransition = true
            dayTick = 90
            day += 1
            
            if self.day == 7 {
                winGame()
            }
//        }
    }
    
    func winGame() {
        withAnimation(.spring()) {
            gameEnded = true
            gameWon = true
        }
    }
    
    func loseGame() {
        withAnimation(.spring()) {
            gameEnded = true
            gameWon = false
        }
    }
    
    func restartGame() {
        dayTransition = false
        dayTick = 90
        day = 0
        
        withAnimation(.spring()) {
            gameEnded = false
        }
        
        objectiveManager.eraseAllObjectives()
        objectiveManager.level_1()
        statusManager.resetAll()
        startDay()
    }
}
