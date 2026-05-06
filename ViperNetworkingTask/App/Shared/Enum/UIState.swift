//
//  UIState.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import Foundation

enum UIState<T> {
    case idle
    case loading
    case success(T)
    case failure(Error)
}
