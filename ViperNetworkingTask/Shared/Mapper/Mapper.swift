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
        product.reviews = dto.reviews
        product.returnPolicy = dto.returnPolicy
        product.thumbnail = Mapper.toURL(dto.thumbnail)
        product.images = dto.images.map { self.toURL($0) }
        
        return product
    }
    
    static func toURL(_ str: String) -> URL? {
        let url = URL(string: str)
        return url
    }
}
