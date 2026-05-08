//
//  ProductDTO.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import Foundation

struct ProductDTO: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: DimensionsDTO
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [ReviewDTO]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: MetaDTO
    let images: [String]
    let thumbnail: String
}

struct DimensionsDTO: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct ReviewDTO: Codable, Hashable {
    let rating: Int
    let comment: String
    let date: Date
    let reviewerName: String
    let reviewerEmail: String
}

struct MetaDTO: Codable {
    let createdAt: Date
    let updatedAt: Date
    let barcode: String
    let qrCode: String
}
