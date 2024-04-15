//
//  WheelView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct WheelView: View {
    
    // MARK: - Properties
    
    private let viewModel: CreateWheelViewModel
    
    private let anglePerSection: Double
    
    private var wheel: Wheel
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
        self.anglePerSection = 360.0 / Double(viewModel.categories.count)
        self.wheel = Wheel(categories: viewModel.categories)
        defer {
            self.wheel.image = snapshot()
        }
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<viewModel.categories.count, id: \.self) { index in
                        let category = viewModel.categories[index]
                        let radius = min(geometry.size.width, geometry.size.height) / 2 - 16
                        let color = Color.random
                        let startAngle = Angle(degrees: Double(index) * anglePerSection)
                        let endAngle = Angle(degrees: Double(index + 1) * anglePerSection)
                        
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                            path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        }
                        .fill(color.opacity(0.3))
                        
                        Path { path in
                            let percentage = category.averagePercentage / 100.0
                            let arcRadius = radius * CGFloat(percentage)
                            
                            path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                            path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2), radius: arcRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        }
                        .fill(color)
                        
                        let labelRadius = radius - 50
                        let labelAngle = startAngle.radians + (endAngle.radians - startAngle.radians) / 2
                        let labelX = geometry.size.width / 2 + labelRadius * CGFloat(cos(labelAngle))
                        let labelY = geometry.size.height / 2 + labelRadius * CGFloat(sin(labelAngle))
                        
                        Text(category.name)
                            .position(x: labelX, y: labelY - 30)
                            .font(AppFont.semibold.s24)
                            .foregroundColor(AppColor.Theme.mainTitle.color)
                        Text(category.averagePercentage.toPercentage)
                            .position(x: labelX, y: labelY)
                            .font(AppFont.medium.s18)
                            .foregroundColor(AppColor.Theme.mainTitle.color)
                    }
                }
            }
            .frame(height: 400)
            VStack {
                ForEach(viewModel.categories.indices, id: \.self) { categoryIndex in
                    let category = viewModel.categories[categoryIndex]
                    VStack {
                        Text(category.name)
                            .font(AppFont.semibold.s24)
                            .foregroundColor(AppColor.Theme.mainTitle.color)
                        ForEach(category.subcategories.indices, id: \.self) { subIndex in
                            let subcategory = category.subcategories[subIndex]
                            HStack {
                                Text(subcategory.name)
                                    .font(AppFont.medium.s18)
                                    .foregroundColor(AppColor.Theme.mainTitle.color)
                                Spacer()
                                Text(subcategory.percentage.toPercentage)
                                    .font(AppFont.medium.s18)
                                    .foregroundColor(AppColor.Theme.mainTitle.color)
                            }
                        }
                    }
                    Rectangle()
                        .border(.gray)
                        .frame(height: 1)
                }
            }
            .padding()
        }
    }
    
    private func snapshot() -> Image? {
        let size = CGSize(width: 50, height: 50)
        return ZStack {
            GeometryReader { geometry in
                ForEach(viewModel.categories.indices, id: \.self) { categoryIndex in
                    let category = viewModel.categories[categoryIndex]
                    let radius = min(geometry.size.width, geometry.size.height) / 2 - 16
                    let color = Color.random
                    let startAngle = Angle(degrees: Double(categoryIndex) * anglePerSection)
                    let endAngle = Angle(degrees: Double(categoryIndex + 1) * anglePerSection)
                    
                    Path { path in
                        path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                        path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    }
                    .fill(color.opacity(0.3))
                    
                    Path { path in
                        let percentage = category.averagePercentage / 100.0
                        let arcRadius = radius * CGFloat(percentage)
                        
                        path.move(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                        path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2), radius: arcRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    }
                    .fill(color)
                }
            }
        }
        .frame(width: size.width, height: size.height)
        .snapshot()
    }
}

#Preview {
    WheelView(viewModel: CreateWheelViewModel(coordinator: CreateWheelCoordinator()))
}
