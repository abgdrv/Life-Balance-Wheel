//
//  WheelCategoryCoordinatorView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 15.04.2024.
//

import SwiftUI

struct WheelCategoryCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: CreateWheelViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        WheelCategoryView(viewModel: viewModel)
    }
}
