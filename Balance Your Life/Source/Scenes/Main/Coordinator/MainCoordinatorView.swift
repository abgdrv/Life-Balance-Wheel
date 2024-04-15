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
                .sheet(isPresented: $viewModel.isSheet) {
                    let vm = CreateWheelViewModel(coordinator: CreateWheelCoordinator())
                    vm.wheels = viewModel.wheels
                    vm.categories = viewModel.wheel.categories
                    return WheelView(viewModel: vm, wheel: viewModel.wheel)
                }
        }
    }
    
    
    private func createWheelCoordinatorView(_ coordinator: CreateWheelCoordinator) -> some View {
        let vm = CreateWheelViewModel(coordinator: coordinator)
        vm.wheels = viewModel.wheels
        return CreateWheelCoordinatorView(viewModel: vm)
    }
}
