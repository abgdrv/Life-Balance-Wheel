//
//  SpashScreenCoordinatorView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

struct SpashScreenCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: SplashScreenViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: SplashScreenViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        SplashScreenView(viewModel: viewModel)
            .onAppear {
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + viewModel.animationDelay + viewModel.animationDuration
                ) {
                    viewModel.showMainFlow()
                }
            }
    }
}
