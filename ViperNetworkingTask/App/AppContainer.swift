//
//  AppContainer.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import Combine

final class AppContainer: ObservableObject {
    
    var router: AppRouter
    init(router: AppRouter) {
        self.router = router
    }
    
    //MARK: Common
    
    lazy var networkManager = {
        NetworkManager()
    }()
        
    //MARK: Interactor
    
    lazy var productListInteractor = {
        ProductListInteractor(networkManager: networkManager)
    }()
    
    lazy var productDetailInteractor = {
        ProductDetailInteractor(networkManager: networkManager)
    }()
    
    
    //MARK: Presenter
    
    //For ObservableObjects(VM) always use method instead of lazy var to reuse the same objectPre
    func makeProductDetailPresenter() -> ProductDetailPresenter {
        ProductDetailPresenter(productDetailInteractor: productDetailInteractor)
    }
    
    func makeProductListPresenter() -> ProductListPresenter {
        ProductListPresenter(productListInteractor: productListInteractor, router: router)
    }
}
