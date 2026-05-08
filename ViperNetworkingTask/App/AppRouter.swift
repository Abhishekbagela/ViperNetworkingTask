//
//  AppRouter.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import SwiftUI
import Combine

enum AppRouterPath: Hashable {
    case productDetails(Int)
}

class AppRouter: ObservableObject {
    
    @Published var path: [AppRouterPath] = []
    
    private func push(_ screen: AppRouterPath) {
        path.append(screen)
    }
    
    private func pop() {
        if path.isEmpty {
            return
        }
        path.removeLast()
    }
    
    private func popToRoot() {
        if path.isEmpty {
            return
        }
        path.removeAll()
    }
    
    func sendToDetail(id: Int) {
        push(.productDetails(id))
    }
    
}
