//
//  WheelSubcategoryView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct WheelSubcategoryView: View {
    
    // MARK: - Properties
        
    @State var name: String = ""
    @State var percentage: Double = 0
    
    let number: Int
    
    let onSubcategoryUpdated: (String, Double) -> Void
    
    // MARK: - UI
    
    var body: some View {
        VStack {
            TextField("Activity \(number)", text: $name, onEditingChanged: { _ in
                onSubcategoryUpdated(name, percentage)
            })
                .frame(height: 30)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .background(AppColor.Theme.mainBackground.color)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            HStack {
                Slider(value: $percentage, in: 0...100, step: 0.5) { _ in
                    onSubcategoryUpdated(name, percentage)
                }
                Text(percentage.toPercentage)
            }
        }
        .frame(height: 60)
        .padding()
        .cornerRadius(10)
    }
}
