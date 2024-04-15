//
//  CreateWheelView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct CreateWheelView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: CreateWheelViewModel

    @State private var isButtonEnabled: Bool
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
        _isButtonEnabled = State(initialValue: viewModel.categories.count >= 2)
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.categories, id: \.id) { category in
                        WheelCategoryCardView(category: category)
                    }
                }
                .padding(.top, 1)
            }
            VStack {
                Spacer()
                CreateWheelButtonView(label: "Generate Wheel", isEnabled: $isButtonEnabled) {
                    viewModel.openWheel()
                }
                .padding(.bottom, -10)
            }
        }
        .onReceive(viewModel.$categories) { categories in
            isButtonEnabled = categories.count >= 2
        }
    }
}


#Preview {
    CreateWheelView(viewModel: CreateWheelViewModel(coordinator: CreateWheelCoordinator()))
}
