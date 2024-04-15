//
//  Date+Extensions.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 13.04.2024.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
