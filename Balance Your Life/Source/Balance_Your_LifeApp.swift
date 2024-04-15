//
//  Balance_Your_LifeApp.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI
import SwiftData

@main
struct Balance_Your_LifeApp: App {
    
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            SpashScreenCoordinatorView(viewModel: SplashScreenViewModel(coordinator: SplashScreenCoordinator()))
        }
    }
}
