//
//  SplashScreenView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    // MARK: - Properties
    
    @State private var isSpinning = false
    
    private let appLogoSize = 150.0
    private let startAngle = 0.0
    private let endAngle = 360.0
    
    private let animationDelay = 0.5
    private let animationDuration = 1.0
    
    private let versionString = "version"
    
    // MARK: - UI
    
    var body: some View {
        VStack {
            Spacer()
            appLogoView
            appNameView
            Spacer()
            versionView
        }
    }
    
    private var appLogoView: some View {
        AppImage.appLogo.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: appLogoSize)
            .rotationEffect(.degrees(isSpinning ? endAngle : startAngle))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        isSpinning = true
                    }
                }
            }
    }
    
    private var appNameView: some View {
        Text(Constants.App.name)
            .font(AppFont.medium.s32)
    }
    
    private var versionView: some View {
        HStack {
            Text(Constants.App.version)
            Text(versionString)
        }
        .font(AppFont.medium.s20)
        .foregroundColor(AppColor.Static.black.color.opacity(0.5))
    }
}

#Preview {
    SplashScreenView()
}
