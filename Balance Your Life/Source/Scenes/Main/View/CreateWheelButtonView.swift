//
//  CreateWheelButtonView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

import SwiftUI

struct CreateWheelButtonView: View {
    
    // MARK: - Properties
    
    @State var opacityState = 1.0
    
    let label: String
    @Binding var isEnabled: Bool
    var didTap: VoidCallback?
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isEnabled ? AppColor.Static.lightBlue.color : .gray)
                .shadow(radius: 2)
                .padding()
            
            HStack(spacing: 20) {
                AppImage.appLogo.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                Text(label)
                    .font(AppFont.regular.s20)
                    .foregroundStyle(.primary)
            }
        }
        .frame(width: 350 ,height: 100)
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
        .disabled(!isEnabled)
    }
}
