//
//  CreateWheelViewModel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import Foundation

final class CreateWheelViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private let coordinator: CreateWheelCoordinator
    
    @Published var wheels: [Wheel] = []
    
    @Published var categories: [WheelCategory] = [
        WheelCategory(name: "dsad", subcategories: [
            WheelSubcategory(name: "asd", percentage: 56.0),
            WheelSubcategory(name: "asd", percentage: 20.0),
            WheelSubcategory(name: "asd", percentage: 74.0)
        ]),
        WheelCategory(name: "dsad", subcategories: [
            WheelSubcategory(name: "asd", percentage: 56.0),
            WheelSubcategory(name: "asd", percentage: 30.0),
            WheelSubcategory(name: "asd", percentage: 54.0)
        ]),
        WheelCategory(name: "dsad", subcategories: [
            WheelSubcategory(name: "asd", percentage: 34.0),
            WheelSubcategory(name: "asd", percentage: 70.0),
            WheelSubcategory(name: "asd", percentage: 54.0)
        ]),
        WheelCategory(name: "dsad", subcategories: [
            WheelSubcategory(name: "asd", percentage: 34.0),
            WheelSubcategory(name: "asd", percentage: 70.0),
            WheelSubcategory(name: "asd", percentage: 54.0)
        ]),
        WheelCategory(name: "dsad", subcategories: [
            WheelSubcategory(name: "asd", percentage: 80.0),
            WheelSubcategory(name: "asd", percentage: 100.0),
            WheelSubcategory(name: "asd", percentage: 54.0)
        ])
    ]
    
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
    
    func addCategory(category: WheelCategory) {
        categories.append(category)
    }
    
    func removeCategory(at index: Int) {
        categories.remove(at: index)
    }
}
