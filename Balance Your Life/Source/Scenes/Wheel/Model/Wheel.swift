//
//  Wheel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 15.04.2024.
//

import SwiftUI

struct Wheel {
    let id = UUID()
    let categories: [WheelCategory]
    let date = Date()
    
    var image: Image? = nil
}
