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
    
    let fetchProductDetailUseCase: FetchProductDetailUseCaseProtocol
    init(fetchProductDetailUseCase: FetchProductDetailUseCaseProtocol) {
        self.fetchProductDetailUseCase = fetchProductDetailUseCase
    }
    
    func getProduct(id: Int) async throws -> Product {
        try await fetchProductDetailUseCase.execute(id: id)
    }
        
}
