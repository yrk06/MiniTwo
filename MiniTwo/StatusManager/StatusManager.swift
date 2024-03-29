//
//  StatusManager.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 05/09/23.
//

import SwiftUI

class StatusManager : ObservableObject {
    
    @Published private var health : Double = 100
    @Published private var hunger : Double = 100
    @Published private var money : Double = 100
    @Published private var log : [String] = []
    @Published private var sndManager : SoundManager = SoundManager()
    
    public func getHealth() -> Double { return self.health }
    public func getHunger() -> Double { return self.hunger }
    public func getMoney() -> Double { return self.money }
    public func getLog() -> [String] { return self.log }
    
    public func setHealth(_ value: Double) { self.health = value }
    public func setHunger(_ value: Double) { self.hunger = value }
    public func setMoney(_ value: Double) { self.money = value }
    
    public func addToLog(_ item: String) { log.append(item) }
    public func removeFirst() { if log.count > 0 { log.removeFirst() } }
    
    public func changeHealth(by value: Double) {
        self.health += value
        if self.health > 100 {
            setHealth(100)
        }
        if value > 0 {
            addToLog("Saúde +\(Int(value))")
        } else {
            addToLog("Saúde \(Int(value))")
        }
    }
    public func changeHunger(by value: Double) {
        self.hunger += value
        if self.hunger > 100 {
            setHunger(100)
        }
        if value > 0 {
            addToLog("Comida +\(Int(value))")
            sndManager.playSound("nhac.wav", loops: 0)
        }
    }
    public func changeMoney(by value: Double) {
        self.money += value
        if self.money > 100 {
            setMoney(100)
        }
        if value > 0 {
            addToLog("Dinheiro +\(Int(value))")
        } else {
            addToLog("Dinheiro \(Int(value))")
            sndManager.playSound("kaching.wav", loops: 0)
        }
    }
    
    public func resetAll() {
        self.health = 100
        self.money = 100
        self.hunger = 100
    }
}
