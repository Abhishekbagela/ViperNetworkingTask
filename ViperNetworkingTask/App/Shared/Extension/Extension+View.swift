//
//  Extension+View.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import SwiftUI

public extension View {
    
    func skeleton(isLoading: Bool) -> some View {
        guard isLoading else {
            return AnyView(self)
        }
        
        let skeletonColor = Color.gray.opacity(0.3)
        
        return AnyView(
            opacity(0)
                .overlay(
                    Rectangle()
                        .fill(skeletonColor)
                )
        )
    }
}
