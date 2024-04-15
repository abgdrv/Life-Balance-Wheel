//
//  WheelCoodinatorView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 15.04.2024.
//

import SwiftUI

struct WheelCoodinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: CreateWheelViewModel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI

    var body: some View {
        WheelView(viewModel: viewModel)
    }
}
