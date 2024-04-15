//
//  WheelCategoryCardView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 15.04.2024.
//

import SwiftUI

struct WheelCategoryCardView: View {
    
    // MARK: - Properties
    
    private let category: WheelCategory
    
    // MARK: - Object Lifecycle
    
    init(category: WheelCategory) {
        self.category = category
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(AppColor.Theme.mainBackground.color)
                .shadow(radius: 5)
            VStack(alignment: .leading, spacing: 10) {
                Text(category.name)
                    .font(AppFont.medium.s20)
                ForEach(category.subcategories.indices, id: \.self) { index in
                    let sub = category.subcategories[index]
                    HStack {
                        Text(sub.name)
                            .font(AppFont.regular.s16)
                        Spacer()
                        Text(sub.percentage.toPercentage)
                            .font(AppFont.regular.s16)
                    }
                }
                HStack {
                    Text("Average: ")
                        .font(AppFont.medium.s16)
                    Spacer()
                    Text(category.averagePercentage.toPercentage)
                        .font(AppFont.regular.s16)
                }
            }
            .padding()
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
}

#Preview {
    WheelCategoryCardView(category: WheelCategory(name: "ASDDS", subcategories: [WheelSubcategory(name: "dasdsa", percentage: 34.9)]))
}
