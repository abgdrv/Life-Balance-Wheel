//
//  WheelCategoryView.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 14.04.2024.
//

import SwiftUI

struct WheelCategoryView: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    
    var viewModel: CreateWheelViewModel
    @State private var categoryName = ""
    
    @State private var category = WheelCategory(name: "", subcategories: [])
    @State private var showingAlert = false
    
    // MARK: - Object Lifecycle
    
    init(viewModel: CreateWheelViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(AppColor.Theme.mainBackground.color)
                            .shadow(radius: 5)
                        VStack {
                            TextField("Category", text: $categoryName, onEditingChanged: { _ in
                                category.name = categoryName
                            })
                                .padding()
                                .background(AppColor.Theme.secondaryBackground.color)
                                .cornerRadius(10)
                                .padding()
                            ForEach(category.subcategories.indices, id: \.self) { index in
                                HStack(spacing: 10) {
                                    WheelSubcategoryView(number: index + 1) { name, percentage in
                                        category.subcategories[index].name = name
                                        category.subcategories[index].percentage = percentage
                                    }
                                    Button(action: {
                                        category.subcategories.remove(at: index)
                                    }, label: {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                    })
                                }
                                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            }
                            Button(action: {
                                category.subcategories.append(WheelSubcategory(name: "", percentage: 0))
                                WheelCategoryView.endEditing()
                            }, label: {
                                Image(systemName: "plus")
                            })
                            .padding(.bottom)
                        }
                    }
                    .padding()
                }
            }
            Button("Save") {
                category.subcategories.forEach { sub in
                    if sub.name.isEmpty {
                        showingAlert = true
                        return
                    }
                }
                guard showingAlert == false else { return }
                WheelCategoryView.endEditing()
                viewModel.categories.append(category)
                dismiss()
            }
            .frame(width: 300)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.bottom)
            .alert("Do not leave empty!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}
