//
//  AppColorProtocol.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation
import SwiftUI

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {
    var color: Color {
        guard let color = UIColor(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return Color(color)
    }
    
    var cgColor: CGColor? {
        return color.cgColor
    }
}
