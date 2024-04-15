//
//  WheelCardView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 13.04.2024.
//

import SwiftUI

struct WheelCardView: View {
    
    // MARK: - Properties
    
    private let card: WheelCard
    
    @State var opacityState = 1.0
    
    var didTap: VoidCallback?
    
    // MARK: - Object Lifecycle
    
    init(card: WheelCard, didTap: VoidCallback? = nil) {
        self.card = card
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
                card.wheelImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                Text(card.dateString)
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
    WheelCardView(card: WheelCard(wheelImage: Image(systemName: "plus"), date: Date()), didTap: nil)
}
