//
//  CreateWheelCoordinator.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct CreateWheelCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: CreateWheelViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        CreateWheelView(viewModel: viewModel)
            .navigation(item: $viewModel.wheelCategoryCoordinator) { coordinator in
                wheelCategoryCoordinatorView(coordinator)
            }
            .navigation(item: $viewModel.wheelCoordinator) { coordinator in
                wheelCoordinatorView(coordinator)
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        viewModel.openCategory()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
    }
    
    @ViewBuilder
    private func wheelCategoryCoordinatorView(_ coordinator: WheelCategoryCoordinator) -> some View {
        WheelCategoryCoordinatorView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func wheelCoordinatorView(_ coordinator: WheelCoordinator) -> some View {
        WheelCoodinatorView(viewModel: viewModel)
    }
}

#Preview {
    CreateWheelCoordinatorView(viewModel: CreateWheelViewModel(coordinator: CreateWheelCoordinator()))
}
