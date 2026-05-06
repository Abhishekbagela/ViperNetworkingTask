//
//  ViperNetworkingTaskApp.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import SwiftUI

@main
struct ViperNetworkingTaskApp: App {
    @StateObject var router: AppRouter
    @StateObject var appContainer: AppContainer
    
    init() {
        let router = AppRouter()
        _router = StateObject(wrappedValue: router)
        _appContainer = StateObject(wrappedValue: AppContainer(router: router))
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                ProductListView(presenter: appContainer.makeProductListPresenter())
                    .navigationDestination(for: AppRouterPath.self, destination: { router in
                        switch router {
                        case .productDetails(let id):
                            ProductDetailsView(id: id, productDetailsPresenter: appContainer.makeProductDetailPresenter())
                        }
                    })
            }
            .environmentObject(appContainer)
        }
    }
}
