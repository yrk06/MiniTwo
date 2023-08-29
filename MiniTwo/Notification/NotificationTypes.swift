//
//  NotificationTypes.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 27/08/23.
//

import Foundation
import SwiftUI

protocol Notification: Identifiable {
    var id: UUID { get }
    var dismissed: Bool {get set}
    var timeToDismiss: Int {get}
    var dismiss: (() -> Void)? {get set}
    @ViewBuilder func getScreenView() -> any View
    @ViewBuilder func getListView() -> any View
}

struct EmptyNotification: Notification {
    var dismiss: (() -> Void)?
    
    var dismissed: Bool = true
    var timeToDismiss: Int = 0
    
    func getScreenView() -> any View {
        EmptyView()
    }
    
    func getListView() -> any View {
        EmptyView()
    }
    
    var id: UUID = UUID()
}

struct TextNotification: Notification {
    var dismiss: (() -> Void)?
    
    
    var id: UUID = UUID()
    var dismissed: Bool = false
    var timeToDismiss: Int = 3
    
    var icon: String = "creditcard"
    var text: String = "Compra aprovada"
    
    
    @ViewBuilder func getScreenView() -> any View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
                .cornerRadius(8)
            Text(text)
        }
        .frame(maxHeight: 72)
        
    }
    
    @ViewBuilder func getListView() -> any View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
                .cornerRadius(8)
            Text(text)
        }
        .frame(maxHeight: 72)
    }
    
    
}

struct CallNotification: Notification {
    var id: UUID = UUID()
    
    var dismissed: Bool = false
    
    var timeToDismiss: Int = 0
    
    var dismiss: (() -> Void)?
    
    var caller: String = "0303 0800 9001"
    
    func getScreenView() -> any View {
        HStack {
            
            Text(caller)
            Image(systemName: "phone.fill")
            Image(systemName: "phone.down.fill")
                .onTapGesture {
                    dismiss!()
                }
        }
        .frame(maxHeight: 72)
    }
    
    func getListView() -> any View {
        EmptyView()
    }
    
    
}


struct NotificationScreenView_Preview: PreviewProvider {
    static var previews: some View {
        AnyView(TextNotification().getScreenView())
    }
}
