//
//  CreateWheelViewModel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import Foundation

final class CreateWheelViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var coordinator: CreateWheelCoordinator?
    
    @Published var wheels: [Wheel] = []
    
    @Published var categories: [WheelCategory] = []
    
    @Published var wheelCategoryCoordinator: WheelCategoryCoordinator?
    @Published var wheelCoordinator: WheelCoordinator?

    
    // MARK: - Object Lifecycle
    
    init(coordinator: CreateWheelCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Methods
    
    func openCategory() {
        wheelCategoryCoordinator = .init()
    }
    
    func openWheel() {
        wheelCoordinator = .init()
    }
    
    func openCreateWheel() {
        coordinator = .init()
    }
    
    func addCategory(category: WheelCategory) {
        categories.append(category)
    }
    
    func removeCategory(at index: Int) {
        categories.remove(at: index)
    }
}
