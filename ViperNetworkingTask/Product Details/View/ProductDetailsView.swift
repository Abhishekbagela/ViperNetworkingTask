//
//  ProductDetailsView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import SwiftUI

/// ProductDetailsView
struct ProductDetailsView<P: ProductDetailPresenterProtocol>: View {
    @StateObject var productDetailsPresenter: P
    
    let id: Int
    init(id: Int, productDetailsPresenter: P) {
        self.id = id
        _productDetailsPresenter = StateObject(wrappedValue: productDetailsPresenter)
    }
    
    var body: some View {
        VStack {
            switch productDetailsPresenter.uiState {
            case .idle:
                Color.clear
            case .loading:
                ProgressView()
            case .success(let product):
                ScrollView(showsIndicators: false) {
                    productDetailsView(product: product)
                    
                    productReviewView(reviews: product.reviews)
                }
            case .failure(let error):
                Text(error.localizedDescription)
                    .padding(.horizontal)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .font(.title2)
            }
        }
        .navigationTitle(Text(productDetailsPresenter.title))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await productDetailsPresenter.getProductDetails(id)
        }
    }
    
    private func productDetailsView(product: Product) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ProductImagesTabView(images: product.images)
            
            Text(product.title)
                .font(.title)
                .bold()
            //                .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            
            keyValueMultilineRowView(key: "Product Information", value: product.description)
            //                .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            
            Group {
                keyValueRowView(key: "Price", value: String(product.price))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                RatingView(label: "Rating", rating: Int(product.rating))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                keyValueRowView(key: "Stock", value: String(product.stock))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                keyValueRowView(key: "Return Policy", value: product.returnPolicy)
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            }
            .font(.footnote)
        }
        .padding()
    }
    
    private func keyValueRowView(key: String, value: String) -> some View {
        HStack(spacing: 15) {
            Text(key)
                .font(.headline)
                .bold()
            Text(value)
                .font(.callout)
        }
    }
    
    private func keyValueMultilineRowView(key: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(key)
                .font(.headline)
                .bold()
            Text(value)
                .font(.callout)
                .lineLimit(4)
        }
    }
    
    private func productReviewView(reviews: [Review]) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Reviews")
                    .font(.title3)
                    .padding(.leading)
                
                ForEach(reviews, id: \.self) { review in
                    VStack {
                        HStack {
                            Text(review.reviewerName)
                            Spacer()
                            Text(DateUtility.shared.formateTo(type: .MMM_d_time_AM, date: review.date))
                        }
                        .font(.callout)
                        .foregroundStyle(Color.gray)
                        
                        RatingView(label: review.comment, rating: review.rating, alignment: .trailing)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ProductDetailsView<ProductDetailPresenter>(
        id: 12, //45
        productDetailsPresenter: ProductDetailPresenter(
            productDetailInteractor: ProductDetailInteractor(
                networkManager: NetworkManager()
            )
        )
    )
}
