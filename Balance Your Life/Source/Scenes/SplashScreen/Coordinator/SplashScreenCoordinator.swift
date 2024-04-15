//
//  SplashScreenCoordinator.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

final class SplashScreenCoordinator {
    
    func showMainFlow() {
        let view = MainCoordinatorView(viewModel: MainViewModel(coordinator: MainCoordinator()))
        Router.setRootView(view, isAnimated: true)
    }
    
}
