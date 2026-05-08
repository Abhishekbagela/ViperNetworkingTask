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
                Theme.Colors.clear
                
            case .loading:
                ProgressView()
                
            case .failure(let error):
                Text(error.localizedDescription)
                    .padding(.horizontal)
                    .foregroundStyle(Theme.Colors.gray.opacity(0.5))
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
                HStack(spacing: Theme.Spacing.P.medium) {
                    AsyncImageView(url: product.thumbnail) {
                        ProgressView()
                    }
                    .contentShape(Rectangle())
                    .frame(width: 70, height: 70)
                    .background(Theme.Colors.lightGray)
                    .cornerRadius(Theme.cornerRadiusMin)
                    
                    VStack(alignment: Theme.Positions.HorizontalAlignments.left) {
                        Text(product.title)
                            .font(Theme.Typography.headline)
                        Text(product.description)
                            .font(Theme.Typography.subheadline)
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
                networkManager: NetworkManager()
            ),
            router: AppRouter()
        )
    )
}


