//
//  FetchProductDetailUseCase.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 08/05/26.
//

import Foundation

protocol FetchProductDetailUseCaseProtocol {
    func execute(id: Int) async throws -> Product
}

final class FetchProductDetailUseCase: FetchProductDetailUseCaseProtocol {
    let networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func execute(id: Int) async throws -> Product {
        let productDTO: ProductDTO = try await networkManager.fetch(urlStr: APIUrl.productDetails(id: id))
        return Mapper.toProduct(dto: productDTO)
    }
}
