//
//  BankPaymentOption.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 30/08/23.
//

import SwiftUI

struct BankPaymentOption: View {
    var body: some View {
        VStack {
            Text("Pagar Boleto")
                .font(.title)
                .bold()
            
            HStack {
                NavigationLink {
                    ARView()
                } label: {
                    VStack {
                        Image(systemName: "doc.viewfinder.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 27)
                            .foregroundColor(.black)
                            .padding(20)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(40)
                            .frame(maxWidth: 80)
                        Text("Automático")
                            .foregroundColor(.black)
                            .font(.callout)
                    }
                }
                
                NavigationLink {
                    BankTyping()
                } label: {
                    VStack {
                        Image(systemName: "barcode")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 27)
                            .foregroundColor(.black)
                            .padding(20)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(40)
                            .frame(maxWidth: 80)
                        Text("Manual")
                            .foregroundColor(.black)
                            .font(.callout)
                    }
                }
            }
        }
    }
}

struct BankPaymentOption_Previews: PreviewProvider {
    static var previews: some View {
        BankPaymentOption()
    }
}
