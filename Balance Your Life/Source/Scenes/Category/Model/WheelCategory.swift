//
//  WheelCategory.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct WheelCategory {
    let id = UUID()
    var name: String
    var subcategories: [WheelSubcategory]
    
    var averagePercentage: Double {
        var sum: Double = 0
        subcategories.forEach { subcategory in
            sum += subcategory.percentage
        }
        return sum / Double(subcategories.count)
    }
}
