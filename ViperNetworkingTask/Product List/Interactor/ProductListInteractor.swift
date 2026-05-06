//
//  ProductListInteractor.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import Foundation

protocol ProductListInteractorProtocol {
    func getProductList() async throws -> [Product]
}

class ProductListInteractor: ProductListInteractorProtocol {
    
    let networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getProductList() async throws -> [Product] {
        // 1. Fetch DTOs
        let response: ProductResponseDTO = try await networkManager.fetch(urlStr: .productList)

        // 2. Map DTOs to pure Domain Entities
        let domainProducts = response.products.map { Mapper.toProduct(dto: $0) }
        
        // 3. Return clean models
        return domainProducts
    }
    
}
