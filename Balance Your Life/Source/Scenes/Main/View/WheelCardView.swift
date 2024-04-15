//
//  WheelCardView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 13.04.2024.
//

import SwiftUI

struct WheelCardView: View {
    
    // MARK: - Properties
    
    private let wheel: Wheel
    
    @State var opacityState = 1.0
    
    var didTap: VoidCallback?
    
    // MARK: - Object Lifecycle
    
    init(wheel: Wheel, didTap: VoidCallback? = nil) {
        self.wheel = wheel
        self.didTap = didTap
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(AppColor.Theme.secondaryBackground.color)
                .shadow(radius: 5)
                .padding()
            
            HStack(spacing: 30) {
                wheel.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                Text(wheel.dateString)
                    .font(AppFont.regular.s24)
                    .foregroundStyle(.primary)
            }
            .padding(20)
        }
        .frame(height: 120)
        .opacity(opacityState)
        .onTapGesture {
            withAnimation(.linear(duration: 0.1)) {
                opacityState = 0.5
            }
            withAnimation(.linear(duration: 0.1).delay(0.1)) {
                opacityState = 1
            }
            didTap?()
        }
    }
}

#Preview {
    WheelCardView(wheel: Wheel(categories: [], image: Image(systemName: "plus")))
}
