//
//  Double+Extensions.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 15.04.2024.
//

import Foundation

extension Double {
    var toPercentage: String {
        String(format: "%.1f%", self) + " %"
    }
}
