//
//  PopBackToRoot.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 05/09/23.
//

import Foundation
import UIKit
import SwiftUI

struct NavigationUtil {
    static func popToRootView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            
            findNavigationController(viewController:window?.rootViewController)?
                .popToRootViewController(animated: true)
        }
    }
    static func popView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            
            findNavigationController(viewController:window?.rootViewController)?
                .popViewController(animated: true)
        }
    }
static func findNavigationController(viewController: UIViewController?)
-> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
if let navigationController = viewController as? UINavigationController
{
        return navigationController
    }
for childViewController in viewController.children {
        return findNavigationController(viewController:
childViewController)
    }
return nil
    }
}
