//
//  ObjectivesManager.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

class ObjectiveManager : ObservableObject {
    
    @Published var allObjectives : [ObjectiveStruct] = []
    
    init() {}
    
    public func add_objective(_ objective: Objective) {
        let obj : ObjectiveStruct = ObjectiveStruct(
            objective: objective
        )
        allObjectives.append(obj)
    }
    
    public func fill_objectives(n : Int8) {
        for _ in 0..<n {
            add_objective(random_objective())
        }
    }
    
    public func complete_mission(type: Objective) {
        var n: Int = 0
        
        for i in allObjectives {
            if i.objective == type && !i.done {
                withAnimation {
                    allObjectives[n].done = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.allObjectives[n].done2 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.allObjectives.remove(at: n)
                        }
                    }
                }
                break
            }
            
            n += 1
        }
    }
    
    public func level_1() {
        add_objective(.boleto)
    }
    
    public func eraseAllObjectives() {
        allObjectives.removeAll()
    }
    
    private func random_objective() -> Objective
    {
        let n : Int8 = Int8.random(in: 1...4)
        switch n {
        case 1: return .boleto
        case 2: return .comer
        case 3: return .privada
        case 4: return .limpar
        default:
            break;
        }
        
        return .boleto
    }
    
}
