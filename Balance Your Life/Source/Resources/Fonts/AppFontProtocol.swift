//
//  AppFontProtocol.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation
import SwiftUI

protocol AppFontProtocol {
    var rawValue: String { get }
}

extension AppFontProtocol {
    private func apply(size value: CGFloat) -> Font {
        guard let font = UIFont(name: rawValue, size: value) else {
            print("Could not find font with name \(rawValue)")
            return .system(size: value)
        }
        return Font(font)
    }
}

extension AppFontProtocol {
    var s10: Font {
        return apply(size: 10)
    }
    
    var s12: Font {
        return apply(size: 12)
    }
    
    var s14: Font {
        return apply(size: 14)
    }
    
    var s16: Font {
        return apply(size: 16)
    }
    
    var s18: Font {
        return apply(size: 18)
    }
    
    var s20: Font {
        return apply(size: 20)
    }
    
    var s22: Font {
        return apply(size: 22)
    }
    
    var s24: Font {
        return apply(size: 24)
    }
    
    var s26: Font {
        return apply(size: 26)
    }
    
    var s28: Font {
        return apply(size: 28)
    }
    
    var s30: Font {
        return apply(size: 30)
    }
    
    var s32: Font {
        return apply(size: 32)
    }
    
    var s40: Font {
        return apply(size: 40)
    }
    
    var s64: Font {
        return apply(size: 64)
    }
}
