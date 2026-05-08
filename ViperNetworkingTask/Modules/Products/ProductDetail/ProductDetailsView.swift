//
//  ProductDetailsView.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 23/04/26.
//

import SwiftUI
import Inject

/// ProductDetailsView
struct ProductDetailsView<P: ProductDetailPresenterProtocol>: View {
    @ObserveInjection var inject
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
                    .foregroundStyle(Theme.Colors.lightGray)
                    .font(Theme.Typography.big)
            }
        }
        .enableInjection()
        .navigationTitle(Text(productDetailsPresenter.title))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await productDetailsPresenter.getProductDetails(id)
        }
    }
    
    private func productDetailsView(product: Product) -> some View {
        VStack(
            alignment: Theme.Positions.HorizontalAlignments.left,
            spacing: Theme.Spacing.P.big
        ) {
            
            ProductImagesTabView(images: product.images)
            
            Text(product.title)
                .font(Theme.Typography.title)
                .bold()
            //                .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            
            KeyValueMultilineRowView(key: "Product Information", value: product.description)
            //                .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            
            Group {
                KeyValueRowView(key: "Price", value: String(product.price))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                ProductRatingView(label: "Rating", rating: Int(product.rating))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                KeyValueRowView(key: "Stock", value: String(product.stock))
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
                KeyValueRowView(key: "Return Policy", value: product.returnPolicy)
                //                    .skeleton(isLoading: productDetailsPresentor.uiState == .loading)
            }
            .font(.footnote)
        }
        .padding()
    }
    
    private func productReviewView(reviews: [ReviewDTO]) -> some View {
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
                        .foregroundStyle(Theme.Colors.gray)
                        
                        ProductRatingView(label: review.comment, rating: review.rating, alignment: .trailing)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(Theme.cornerRadiusMin)
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
