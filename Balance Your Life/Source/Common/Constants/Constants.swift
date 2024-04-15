//
//  Constants.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation

enum Constants {
    
    // MARK: - App
    
    enum App {
        static let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
        static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    // MARK: - String
    
    enum Strings {
        static let version = "version"
    }
    
    // MARK: - DateFormat
    
    enum DateFormat {
        static let weekMonthDay = "EEEE, MMMM dd"
    }
}
