//
//  Router.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

final class Router {
    
    static var window: UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        
        guard let window = windowScene?.windows.first else { return nil }
        
        return window
    }
    
    static func setRootView( _ view: some View, isAnimated: Bool = true) {
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = isAnimated ? 0.4 : 0.0
        window?.rootViewController = UIHostingController(rootView: view)
        UIView.transition(with: window!, duration: duration, options: options, animations: {})
    }
    
}
