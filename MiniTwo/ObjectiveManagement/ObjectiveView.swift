//
//  ObjectivesView.swift
//  MiniTwo
//
//  Created by Gustavo Binder on 30/08/23.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct ObjectiveView: View {
    
    @Namespace var namespace
    
    @EnvironmentObject var objMan : ObjectiveManager
    @State var maximized : Bool = true
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Text("\(objMan.allObjectives.count)")
                    .fontBob(size: 64)
                    .foregroundColor(Color("OrangeFood"))
                    .frame(width: 120)
                Text("pepinos")
                    .fontBob(size: 14)
                    .foregroundColor(.black)
//                Image("pepinos")
            }
            .padding(.trailing, 26)
            
            VStack (alignment: .leading) {
                ForEach(Range(0...2), id: \.self) { i in
                    if i < objMan.allObjectives.count {
                        if i > 0 {
                            Line()
                               .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                               .frame(height: 1)
                               .padding(.vertical, 4)
                               .foregroundColor(.gray)
                        }
                        if !objMan.allObjectives[i].done2 {
                            HStack {
                                
                                if objMan.allObjectives[i].done {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color("OrangeFood"))
                                }
                                
                                Text("\(objMan.allObjectives[i].objective.rawValue)")
                                    .font(.footnote)
                                    .padding(.bottom, 2)
                            }
                            .transition(.scale)
                        }
                    }
                }
                if objMan.allObjectives.count > 3 {
//                    Line()
//                       .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
//                       .frame(height: 1)
//                       .padding(.vertical, 6)
                    HStack {
                        Text("+\(objMan.allObjectives.count - 3) pepinos")
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                }
            }
            Spacer()
        }
        .frame(height: 115)
        .padding()
        .background {
            Color(.white)
        }
        .cornerRadius(22)
        .shadow(radius: 10, x: 0, y: 5)
        .padding()
    }
}

