//
//  ProductListPresenter.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import Foundation
import Combine

@MainActor
protocol ProductListPresenterProtocol: ObservableObject {
    var uiState: UIState<[Product]> {get}
    var searchText: String {get set}
    var filteredProductList: [Product] {get}
    func getProducts() async
    func didSelectProduct(id: Int)
}

final class ProductListPresenter: ProductListPresenterProtocol {
    
    @Published var uiState: UIState<[Product]> = .idle
    @Published var searchText: String = ""
    
    private var products: [Product] = []
    
    let productListInteractor: ProductListInteractorProtocol
    let router: AppRouter
    init(productListInteractor: ProductListInteractorProtocol, router: AppRouter) {
        self.productListInteractor = productListInteractor
        self.router = router
    }
    
    var filteredProductList: [Product] {
        if searchText.isEmpty {
            products
            
        } else {
            products.filter({
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText) ||
                $0.brand?.localizedCaseInsensitiveContains(searchText) == true ||
                $0.price == Double(searchText) ||
                $0.rating == Double(searchText) ||
                $0.stock == Int(searchText)
            })
        }
    }

    func getProducts() async {
        uiState = .loading
        
        do {
            products = try await productListInteractor.getProductList()
            uiState = .success(products)
        } catch {
            uiState = .failure(error)
        }
    }
 
    func didSelectProduct(id: Int) {
        router.sendToDetail(id: id)
    }
    
}
