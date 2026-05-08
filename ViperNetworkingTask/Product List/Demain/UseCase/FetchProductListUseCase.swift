//
//  FetchProductListUseCase.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import Foundation

protocol FetchProductListUseCaseProtocol {
    func execute() async throws -> [Product]
}

final class FetchProductListUseCase: FetchProductListUseCaseProtocol {
    let networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func execute() async throws -> [Product] {
        // 1. Fetch DTOs
        let response: ProductResponseDTO = try await networkManager.fetch(urlStr: .productList)

        // 2. Map DTOs to pure Domain Entities
        let domainProducts = response.products.map { Mapper.toProduct(dto: $0) }
        
        // 3. Return clean models
        return domainProducts
    }
}
