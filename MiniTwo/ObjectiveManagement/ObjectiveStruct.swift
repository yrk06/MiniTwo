//
//  ObjectiveStruct.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

enum Objective : String {
    case boleto = "boleto"
    case privada = "privada"
    case comer = "comer"
    case limpar = "limpar"
}

struct ObjectiveStruct : Identifiable {
    var id: UUID
    
    var objective : Objective
    var done : Bool
    
    init(objective: Objective) {
        self.objective = objective
        self.done = false
        self.id = UUID()
    }
}

