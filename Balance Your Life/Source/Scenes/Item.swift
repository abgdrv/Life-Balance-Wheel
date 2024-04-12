//
//  Item.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
