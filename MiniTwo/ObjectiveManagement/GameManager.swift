//
//  GameManager.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 04/09/23.
//

import Foundation

enum stat {
    case health, money, energy
}

class GameManager: ObservableObject {
    
    @Published var day: Int = 0
    @Published var dayTick = 18
    @Published var dayTransition = false
    var dayTimer: Timer?
    
    var objectiveManager: ObjectiveManager = ObjectiveManager()

    
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
        
        dayTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: {
                _ in
            self.dayTick -= 1
            if self.dayTick == 0 {
                self.dayTimer?.invalidate()
                self.endDay()
            }
            if self.objectiveManager.allObjectives.filter({$0.done}).count == self.getTaskCount() {
                self.dayTimer?.invalidate()
                self.objectiveManager.allObjectives = []
                self.endDay()
            }
            
        })
    }
    
    func endDay() {
        dayTransition = true
        dayTick = 18
        day += 1
//        dayTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: {
//                _ in
//            self.startDay()
//        })
    }
}
