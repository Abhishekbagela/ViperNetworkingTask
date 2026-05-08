//
//  ProductListView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import SwiftUI
import Inject

struct ProductListView<P: ProductListPresenterProtocol>: View where P: ObservableObject {
    @ObserveInjection var inject
    @StateObject var presenter: P
    
    init(presenter: P) {
        _presenter = StateObject(wrappedValue: presenter)
    }
    
    var body: some View {
        VStack {
            switch presenter.uiState {
            case .idle:
                Color.clear
                
            case .loading:
                ProgressView()
                
            case .failure(let error):
                Text(error.localizedDescription)
                    .padding(.horizontal)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .font(.title2)
                
            case .success(_):
                productListView(presenter.filteredProductList)
            }
        }
        .enableInjection()
        .navigationTitle(Text("Products"))
        .task {
            await presenter.getProducts()
        }
        .refreshable {
            await presenter.getProducts()
        }
        .searchable(text: $presenter.searchText, prompt: "Find...")
    }
    
    private func productListView(_ products: [Product]) -> some View {
        ScrollView(showsIndicators: false) {
            ForEach(products, id: \.id) { product in
                HStack(spacing: 10) {
                    AsyncImage(url: product.thumbnail) { Image in
                        Image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .contentShape(Rectangle())
                    .frame(width: 70, height: 70)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text(product.description)
                            .font(.subheadline)
                            .lineLimit(2)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        presenter.didSelectProduct(id: product.id)
                    }
                }
            }
        }
    }
}

#Preview {
    ProductListView<ProductListPresenter>(
        presenter: ProductListPresenter(
            productListInteractor: ProductListInteractor(
                networkManager: MockNetworkManager()
            ), router: AppRouter()
        )
    )
}


