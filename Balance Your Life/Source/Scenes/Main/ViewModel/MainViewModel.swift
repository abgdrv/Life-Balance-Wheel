//
//  MainViewModel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private var coordindator: MainCoordinator
    
    @Published var createWheelCoordinator: CreateWheelCoordinator?
    
    @Published var wheels: [Wheel] = []
    @Published var isSheet: Bool = false
    @Published var wheel: Wheel = Wheel(categories: [])
    
    func openCreateWheel() {
        createWheelCoordinator = .init()
    }
    
    private(set) var wheelCards: [WheelCard] = []
    
    // MARK: - Object Lifecycle
    
    init(coordinator: MainCoordinator) {
        self.coordindator = coordinator
    }
    
    // MARK: - Methods
    
    func showWheelDetails(wheel: Wheel) {
        isSheet = true
        self.wheel = wheel
    }
    
}
