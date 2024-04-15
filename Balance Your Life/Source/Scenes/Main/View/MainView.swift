//
//  MainView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    private let viewModel: MainViewModel
    
    @State var isEnabled = true
    
    // MARK: - Object Lifecycle
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: -10) {
                    ForEach(0..<viewModel.wheels.count, id: \.self) { index in
                        let wheel = viewModel.wheels[index]
                        WheelCardView(wheel: wheel) {
                            viewModel.showWheelDetails(wheel: wheel)
                        }
                    }
                }
                .padding(.top, 1)
            }
            VStack {
                Spacer()
                CreateWheelButtonView(label: "Create Your Wheel", isEnabled: $isEnabled) {
                    viewModel.openCreateWheel()
                }
                .padding(.bottom, -10)
            }
        }
    }
}
