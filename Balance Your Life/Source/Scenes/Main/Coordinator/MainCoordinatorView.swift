//
//  MainCoordinatorView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

struct MainCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: MainViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        NavigationView {
            MainView(viewModel: viewModel)
                .navigationTitle("Wheels")
                .navigation(item: $viewModel.createWheelCoordinator) { coordinator in
                    createWheelCoordinatorView(coordinator)
                }
        }
    }
    
    @ViewBuilder
    private func createWheelCoordinatorView(_ coordinator: CreateWheelCoordinator) -> some View {
        CreateWheelCoordinatorView(viewModel: CreateWheelViewModel(coordinator: coordinator))
    }
}

#Preview {
    MainCoordinatorView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
