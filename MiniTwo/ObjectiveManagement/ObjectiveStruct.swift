//
//  ObjectiveStruct.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

enum Objective : String {
    case boleto = "Pagar boleto"
    case privada = "A PRIVADA ENTUPIU!"
    case comer = "Comer"
    case limpar = "Limpar a casa"
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

