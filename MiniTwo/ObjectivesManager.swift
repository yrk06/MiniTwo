//
//  ObjectivesManager.swift
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
        for _ in 0...n {
            add_objective(random_objective())
        }
    }
    
    public func level_1() {
        add_objective(.boleto)
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

struct ObjectiveView: View {
    
    @EnvironmentObject var objMan : ObjectiveManager
    @State var maximized : Bool = true
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(objMan.allObjectives) { i in
                HStack {
                    if i.done {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "x.circle")
                            .foregroundColor(.red)
                    }
                    Text("\(i.objective.rawValue)")
                        .padding(.bottom, 2)
                }
            }
        }
        .padding()
        .background()
        .cornerRadius(8)
        .shadow(radius: 10, x: 0, y: 5)
    }
}
