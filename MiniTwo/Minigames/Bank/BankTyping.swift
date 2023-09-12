//
//  BankTyping.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 11/09/23.
//

import SwiftUI

struct NumberButton: View {
    
    let main: String
    let sub: String
    
    var body: some View {
        VStack {
            Text(main)
            Text(sub)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct BankTyping: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var objMan: ObjectiveManager
    
    @State var number: String = ""
    @State var target: String = ""
    @State var buttons: [NumberButton] = [
        NumberButton(main: "1", sub: ""),
        NumberButton(main: "2", sub: "ABC"),
        NumberButton(main: "3", sub: "DEF"),
        NumberButton(main: "4", sub: "GHI"),
        NumberButton(main: "5", sub: "JKL"),
        NumberButton(main: "6", sub: "MNO"),
        NumberButton(main: "7", sub: "PQRS"),
        NumberButton(main: "8", sub: "TUV"),
        NumberButton(main: "9", sub: "WXY"),
        NumberButton(main: "0", sub: "Z"),
    ]
    @State var barcode: [CGFloat] = []
    @State var visible: Bool = false
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                HStack (spacing: 4) {
    
                    ForEach(0..<32)
                    {i in
                        if i < barcode.count {
                            Rectangle()
                                .frame(maxWidth: barcode[i], maxHeight: .infinity)
                        }
                        
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: 96)
                HStack {
                    Text(target)
                }
                .padding(8)
                .background(.white)
            }
            
            HStack {
                VStack {
                    Text(number.isEmpty ? "Código" : ( visible ? number : "*" * number.count))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                     .frame(height: 1)
                }
                
                Spacer()
                
                Button {} label: {
                    Image(systemName: "eye.slash")
                        .onLongPressGesture(minimumDuration: .infinity) {
                            
                        } onPressingChanged: { starting in
                            visible = starting
                        }
                }
                .foregroundColor(.black)
            }.padding(.horizontal)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(buttons.indices.dropLast()) { idx in
                    Button {
                        number += buttons[idx].main
                    } label: {
                        buttons[idx]
                            .foregroundColor(.black)
                    }
                    
                }
                Group {
                    Image(systemName: "space")
                    Button {
                        number += buttons.last!.main
                    } label: {
                        buttons.last!
                            .foregroundColor(.black)
                    }
                    Button {
                        if number.count > 0 {
                            number.removeLast()
                        }
                        
                    } label: {
                        Image(systemName: "delete.backward.fill")
                    }
                    .foregroundColor(.black)
                    
                }
                
            }
            
        }
        .onAppear {
            for _ in 0..<32 {
                barcode.append(CGFloat.random(in: 0...16))
            }
            target = "\(Int.random(in: 1000...9999))\(Int.random(in: 1000...9999))"
            buttons.shuffle()
        }
        .onChange(of: number) {
            nv in
            if nv == target {
                objMan.complete_mission(type: .boleto)
                dismiss()
            }
        }
        
        
        
    }
}

struct BankTyping_Previews: PreviewProvider {
    static var previews: some View {
        BankTyping()
    }
}
