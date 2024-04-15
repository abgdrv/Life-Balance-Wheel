//
//  SplashScreenViewModel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

final class SplashScreenViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private let coordinator: SplashScreenCoordinator
        
    let appLogoSize = 150.0
    let startAngle = 0.0
    let endAngle = 360.0
    
    let animationDelay = 0.5
    let animationDuration = 1.0
    
    init(coordinator: SplashScreenCoordinator) {
        self.coordinator = coordinator
    }
    
    func showMainFlow() {
        coordinator.showMainFlow()
    }
}
