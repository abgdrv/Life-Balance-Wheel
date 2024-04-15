//
//  SplashScreenView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: SplashScreenViewModel
    
    @State var isSpinning = false
    
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
            .frame(width: viewModel.appLogoSize)
            .rotationEffect(.degrees(isSpinning
                                     ? viewModel.endAngle
                                     : viewModel.startAngle))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + viewModel.animationDelay) {
                    withAnimation(.easeInOut(duration: viewModel.animationDuration)) {
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
            Text(Constants.Strings.version)
        }
        .font(AppFont.medium.s20)
        .foregroundColor(AppColor.Static.black.color.opacity(0.5))
    }
}
