//
//  ProductDetailInteractor.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import Foundation

protocol ProductDetailInteractorProtocol: AnyObject {
    func getProduct(id: Int) async throws -> Product
}

final class ProductDetailInteractor: ProductDetailInteractorProtocol {
    
    let networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getProduct(id: Int) async throws -> Product {
        let productDTO: ProductDTO = try await networkManager.fetch(urlStr: APIUrl.productDetails(id: id))
        return Mapper.toProduct(dto: productDTO)
    }
        
}
