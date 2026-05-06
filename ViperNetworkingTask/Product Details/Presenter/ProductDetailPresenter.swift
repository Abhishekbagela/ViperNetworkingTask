//
//  ProductDetailPresenter.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import Foundation
import Combine

@MainActor
protocol ProductDetailPresenterProtocol: ObservableObject {
    var uiState: UIState<Product> {get set}
    var title: String {get set}
    func getProductDetails(_ id: Int) async
    func resetState()
}

final class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    @Published var uiState: UIState<Product> = .idle
    @Published var title: String = ""
    
    let productDetailInteractor: ProductDetailInteractorProtocol
    
    init(productDetailInteractor: ProductDetailInteractorProtocol) {
        self.productDetailInteractor = productDetailInteractor
    }
    
    func getProductDetails(_ id: Int) async {
        uiState = .loading
        do {
            let product = try await productDetailInteractor.getProduct(id: id)
            title = product.title
            uiState = .success(product)
        } catch let error {
            uiState = .failure(error)
        }
    }
    
    func resetState() {
        uiState = .idle
        title = ""
    }
}
