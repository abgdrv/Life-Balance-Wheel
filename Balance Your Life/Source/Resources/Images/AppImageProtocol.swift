//
//  AppImageProtocol.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import Foundation
import SwiftUI

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {
    var image: Image {
        return Image(uiImage: uiImage ?? UIImage())
    }
    
    private var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}
