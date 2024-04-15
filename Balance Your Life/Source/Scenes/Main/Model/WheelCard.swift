//
//  WheelCard.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 13.04.2024.
//

import SwiftUI

struct WheelCard {
    let wheelImage: Image
    private let date: Date
    
    var dateString: String {
        date.toString(format: Constants.DateFormat.weekMonthDay)
    }
    
    init(wheelImage: Image, date: Date) {
        self.wheelImage = wheelImage
        self.date = date
    }
}
