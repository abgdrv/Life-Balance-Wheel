//
//  BaseViewModel.swift
//  Balance Your Life
//
//  Created by Almat Begaidarov on 12.04.2024.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var alert = ""
    @Published var showingAlert = false
    @Published var isLoading = false
    
    @Published var disposables = Set<AnyCancellable>()
}
