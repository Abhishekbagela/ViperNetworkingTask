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
        let response: ProductResponse = try await networkManager.fetch(urlStr: .productList)
        return response.products
    }
    
}
