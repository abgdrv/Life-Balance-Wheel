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
    
    func openCreateWheel() {
        createWheelCoordinator = .init()
    }
    
    private(set) var wheelCards: [WheelCard] = [
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date()),
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date()),
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date()),
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date()),
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date()),
        WheelCard(wheelImage: Image(systemName: "plus"), date: Date())
    ]
    
    // MARK: - Object Lifecycle
    
    init(coordinator: MainCoordinator) {
        self.coordindator = coordinator
    }
    
    // MARK: - Methods
    
    func showWheelDetails(card: WheelCard) {
        
    }
    
}
