//
//  ProductDTO.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 05/05/26.
//

import Foundation

struct ProductResponseDTO: Codable {
    var products: [ProductDTO]
    var total: Int
    var skip: Int
    var limit: Int
}
