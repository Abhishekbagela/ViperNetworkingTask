//
//  Mapper.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 06/05/26.
//

import Foundation

struct Mapper {
    
    static func toProduct(dto: ProductDTO) -> Product {
        var product = Product()
        product.id = dto.id
        product.title = dto.title
        product.description = dto.description
        product.price = dto.price
        product.brand = dto.brand ?? ""
        product.rating = dto.rating
        product.stock = dto.stock
        product.reviews = dto.reviews.map { self.toReview($0) }
        product.returnPolicy = dto.returnPolicy
        product.thumbnail = dto.thumbnail.toURL()
        product.images = dto.images.map { $0.toURL() }
        
        return product
    }
//    
//    static func toProduct(model: ProductModel?) -> Product? {
//        guard let model = model else { return nil }
//        var product = Product()
//        product.id = Int(model.id)
//        product.stock = Int(model.stock)
//        product.price = model.price
//        product.rating = model.rating
//        product.thumbnail = model.thumbnail?.toURL()
//        
//        if let images_ = model.images_ {
//            product.images = images_.compactMap { element in
//                return (element as? String)?.toURL()
//            }
//        }
//        
//        if let description = model.desc {
//            product.description = description
//        }
//        if let title = model.title {
//            product.title = title
//        }
//        if let brand = model.brand {
//            product.brand = brand
//        }
//        model.reviewsList.forEach({ reviewModel in
//            product.reviews.append(toReview(reviewModel))
//        })
//        
//        if let returnPolicy = model.returnPolicy {
//            product.returnPolicy = returnPolicy
//        }
//        return product
//    }
    
//    static func toReview(_ model: ReviewModel) -> Review {
//        var review = Review()
//        review.rating = Int(model.rating)
//        if let comment = model.comment {
//            review.comment = comment
//        }
//        if let date = model.date {
//            review.date = date
//        }
//        if let reviewerEmail = model.reviewerEmail {
//            review.reviewerEmail = reviewerEmail
//        }
//        if let reviewerName = model.reviewerName {
//            review.reviewerName = reviewerName
//        }
//        return review
//    }
    
    static func toReview(_ dto: ReviewDTO) -> Review {
        var review = Review()
        review.comment = dto.comment
        review.date = dto.date
        review.rating = dto.rating
        review.reviewerEmail = dto.reviewerEmail
        review.reviewerName = dto.reviewerName
        return review
    }
    
}
