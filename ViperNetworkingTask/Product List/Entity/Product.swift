//
//  Product.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 06/05/26.
//

import Foundation

struct Product {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var price: Double = 0.0
    var brand: String = ""
    var rating: Double = 0.0
    var stock: Int = 0
    var reviews: [ReviewDTO] = []
    var returnPolicy: String = ""
    var thumbnail: URL? = URL(string: "")
    var images: [URL?] = [URL(string: "")]
}
