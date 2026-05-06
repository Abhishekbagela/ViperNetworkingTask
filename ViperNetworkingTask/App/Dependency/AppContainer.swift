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
    
    lazy var networkManager = {
        NetworkManager()
    }()
 
    lazy var productListInteractor = {
        ProductListInteractor(networkManager: networkManager)
    }()
    
//    lazy var productListPresenter = {
//        ProductListPresenter(productListInteractor: productListInteractor)
//    }()
    
    func makeProductListPresenter() -> ProductListPresenter {
        ProductListPresenter(productListInteractor: productListInteractor, router: router)
    }
    
    lazy var productDetailInteractor = {
        ProductDetailInteractor(networkManager: networkManager)
    }()
    
//    lazy var productDetailsPresentor = {
//        ProductDetailPresenter(productDetailInteractor: productDetailInteractor)
//    }()
    
    //For ObservableObjects(VM) always use method instead of lazy var to reuse the same objectPre
    func makeProductDetailPresenter() -> ProductDetailPresenter {
        ProductDetailPresenter(productDetailInteractor: productDetailInteractor)
    }
}
