//
//  SplashScreenCoordinator.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

final class SplashScreenCoordinator {
    
    func showMainFlow() {
        let vm = MainViewModel(coordinator: MainCoordinator())
        let view = MainCoordinatorView(viewModel: vm)
        Router.setRootView(view, isAnimated: true)
    }
    
}
