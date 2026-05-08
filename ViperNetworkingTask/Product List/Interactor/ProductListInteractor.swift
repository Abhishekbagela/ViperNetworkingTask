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

final class ProductListInteractor: ProductListInteractorProtocol {
    
    let fetchProductListUseCase: FetchProductListUseCaseProtocol
    init(fetchProductListUseCase: FetchProductListUseCaseProtocol) {
        self.fetchProductListUseCase = fetchProductListUseCase
    }
    
    func getProductList() async throws -> [Product] {
       try await fetchProductListUseCase.execute()
    }
    
}
