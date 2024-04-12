//
//  AppColor.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation

enum AppColor {
    
    // MARK: - Static
    
    enum Static: String, AppColorProtocol {
        case black = "black"
        case white = "white"
    }
    
    // MARK: - Theme
    
    enum Theme: String, AppColorProtocol {
        case mainBackground = "main_background"
        case mainTitle = "main_title"
        case secondaryBackground = "secondary_background"
    }
}
