//
//  Product.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import Foundation

struct Product: Codable {
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
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct Review: Codable, Hashable {
    let rating: Int
    let comment: String
    let date: Date   // keep String for now (safe)
    let reviewerName: String
    let reviewerEmail: String
}

struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}

//extension Product {
//    
//    var productsJson: ProductResponse {
//        {
//            "limit" : 30,
//            "products" : [
//                {
//                    "availabilityStatus" : "In Stock",
//                    "brand" : "Essence",
//                    "category" : "beauty",
//                    "description" : "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
//                    "dimensions" : {
//                        "depth" : 22.989999999999998,
//                        "height" : 13.08,
//                        "width" : 15.140000000000001
//                    },
//                    "discountPercentage" : 10.48,
//                    "id" : 1,
//                    "images" : [
//                        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
//                    ],
//                    "meta" : {
//                        "barcode" : "5784719087687",
//                        "createdAt" : "2025-04-30T09:41:02.053Z",
//                        "qrCode" : "https://cdn.dummyjson.com/public/qr-code.png",
//                        "updatedAt" : "2025-04-30T09:41:02.053Z"
//                    },
//                    "minimumOrderQuantity" : 48,
//                    "price" : 9.9900000000000002,
//                    "rating" : 2.5600000000000001,
//                    "returnPolicy" : "No return policy",
//                    "reviews" : [
//                        {
//                            "comment" : "Would not recommend!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 3,
//                            "reviewerEmail" : "eleanor.collins@x.dummyjson.com",
//                            "reviewerName" : "Eleanor Collins"
//                        },
//                        {
//                            "comment" : "Very satisfied!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 4,
//                            "reviewerEmail" : "lucas.gordon@x.dummyjson.com",
//                            "reviewerName" : "Lucas Gordon"
//                        },
//                        {
//                            "comment" : "Highly impressed!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "eleanor.collins@x.dummyjson.com",
//                            "reviewerName" : "Eleanor Collins"
//                        }
//                    ],
//                    "shippingInformation" : "Ships in 3-5 business days",
//                    "sku" : "BEA-ESS-ESS-001",
//                    "stock" : 99,
//                    "tags" : [
//                        "beauty",
//                        "mascara"
//                    ],
//                    "thumbnail" : "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
//                    "title" : "Essence Mascara Lash Princess",
//                    "warrantyInformation" : "1 week warranty",
//                    "weight" : 4
//                },
//                {
//                    "availabilityStatus" : "In Stock",
//                    "brand" : "Glamour Beauty",
//                    "category" : "beauty",
//                    "description" : "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
//                    "dimensions" : {
//                        "depth" : 27.670000000000002,
//                        "height" : 22.469999999999999,
//                        "width" : 9.2599999999999998
//                    },
//                    "discountPercentage" : 18.190000000000001,
//                    "id" : 2,
//                    "images" : [
//                        "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp"
//                    ],
//                    "meta" : {
//                        "barcode" : "9170275171413",
//                        "createdAt" : "2025-04-30T09:41:02.053Z",
//                        "qrCode" : "https://cdn.dummyjson.com/public/qr-code.png",
//                        "updatedAt" : "2025-04-30T09:41:02.053Z"
//                    },
//                    "minimumOrderQuantity" : 20,
//                    "price" : 19.989999999999998,
//                    "rating" : 2.8599999999999999,
//                    "returnPolicy" : "7 days return policy",
//                    "reviews" : [
//                        {
//                            "comment" : "Great product!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "savannah.gomez@x.dummyjson.com",
//                            "reviewerName" : "Savannah Gomez"
//                        },
//                        {
//                            "comment" : "Awesome product!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 4,
//                            "reviewerEmail" : "christian.perez@x.dummyjson.com",
//                            "reviewerName" : "Christian Perez"
//                        },
//                        {
//                            "comment" : "Poor quality!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 1,
//                            "reviewerEmail" : "nicholas.bailey@x.dummyjson.com",
//                            "reviewerName" : "Nicholas Bailey"
//                        }
//                    ],
//                    "shippingInformation" : "Ships in 2 weeks",
//                    "sku" : "BEA-GLA-EYE-002",
//                    "stock" : 34,
//                    "tags" : [
//                        "beauty",
//                        "eyeshadow"
//                    ],
//                    "thumbnail" : "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp",
//                    "title" : "Eyeshadow Palette with Mirror",
//                    "warrantyInformation" : "1 year warranty",
//                    "weight" : 9
//                },
//                {
//                    "availabilityStatus" : "In Stock",
//                    "brand" : "Velvet Touch",
//                    "category" : "beauty",
//                    "description" : "The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.",
//                    "dimensions" : {
//                        "depth" : 20.59,
//                        "height" : 27.93,
//                        "width" : 29.27
//                    },
//                    "discountPercentage" : 9.8399999999999999,
//                    "id" : 3,
//                    "images" : [
//                        "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp"
//                    ],
//                    "meta" : {
//                        "barcode" : "8418883906837",
//                        "createdAt" : "2025-04-30T09:41:02.053Z",
//                        "qrCode" : "https://cdn.dummyjson.com/public/qr-code.png",
//                        "updatedAt" : "2025-04-30T09:41:02.053Z"
//                    },
//                    "minimumOrderQuantity" : 22,
//                    "price" : 14.99,
//                    "rating" : 4.6399999999999997,
//                    "returnPolicy" : "No return policy",
//                    "reviews" : [
//                        {
//                            "comment" : "Would buy again!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 4,
//                            "reviewerEmail" : "alexander.jones@x.dummyjson.com",
//                            "reviewerName" : "Alexander Jones"
//                        },
//                        {
//                            "comment" : "Highly impressed!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "elijah.cruz@x.dummyjson.com",
//                            "reviewerName" : "Elijah Cruz"
//                        },
//                        {
//                            "comment" : "Very dissatisfied!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 1,
//                            "reviewerEmail" : "avery.perez@x.dummyjson.com",
//                            "reviewerName" : "Avery Perez"
//                        }
//                    ],
//                    "shippingInformation" : "Ships in 1-2 business days",
//                    "sku" : "BEA-VEL-POW-003",
//                    "stock" : 89,
//                    "tags" : [
//                        "beauty",
//                        "face powder"
//                    ],
//                    "thumbnail" : "https://cdn.dummyjson.com/product-images/beauty/powder-canister/thumbnail.webp",
//                    "title" : "Powder Canister",
//                    "warrantyInformation" : "3 months warranty",
//                    "weight" : 8
//                },
//                {
//                    "availabilityStatus" : "In Stock",
//                    "brand" : "Chic Cosmetics",
//                    "category" : "beauty",
//                    "description" : "The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.",
//                    "dimensions" : {
//                        "depth" : 22.170000000000002,
//                        "height" : 28.379999999999999,
//                        "width" : 18.109999999999999
//                    },
//                    "discountPercentage" : 12.16,
//                    "id" : 4,
//                    "images" : [
//                        "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp"
//                    ],
//                    "meta" : {
//                        "barcode" : "9467746727219",
//                        "createdAt" : "2025-04-30T09:41:02.053Z",
//                        "qrCode" : "https://cdn.dummyjson.com/public/qr-code.png",
//                        "updatedAt" : "2025-04-30T09:41:02.053Z"
//                    },
//                    "minimumOrderQuantity" : 40,
//                    "price" : 12.99,
//                    "rating" : 4.3600000000000003,
//                    "returnPolicy" : "7 days return policy",
//                    "reviews" : [
//                        {
//                            "comment" : "Great product!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 4,
//                            "reviewerEmail" : "liam.garcia@x.dummyjson.com",
//                            "reviewerName" : "Liam Garcia"
//                        },
//                        {
//                            "comment" : "Great product!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "ruby.andrews@x.dummyjson.com",
//                            "reviewerName" : "Ruby Andrews"
//                        },
//                        {
//                            "comment" : "Would buy again!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "clara.berry@x.dummyjson.com",
//                            "reviewerName" : "Clara Berry"
//                        }
//                    ],
//                    "shippingInformation" : "Ships in 1 week",
//                    "sku" : "BEA-CHI-LIP-004",
//                    "stock" : 91,
//                    "tags" : [
//                        "beauty",
//                        "lipstick"
//                    ],
//                    "thumbnail" : "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/thumbnail.webp",
//                    "title" : "Red Lipstick",
//                    "warrantyInformation" : "3 year warranty",
//                    "weight" : 1
//                },
//                {
//                    "availabilityStatus" : "In Stock",
//                    "brand" : "Nail Couture",
//                    "category" : "beauty",
//                    "description" : "The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.",
//                    "dimensions" : {
//                        "depth" : 29.84,
//                        "height" : 16.48,
//                        "width" : 21.629999999999999
//                    },
//                    "discountPercentage" : 11.44,
//                    "id" : 5,
//                    "images" : [
//                        "https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/1.webp"
//                    ],
//                    "meta" : {
//                        "barcode" : "4063010628104",
//                        "createdAt" : "2025-04-30T09:41:02.053Z",
//                        "qrCode" : "https://cdn.dummyjson.com/public/qr-code.png",
//                        "updatedAt" : "2025-04-30T09:41:02.053Z"
//                    },
//                    "minimumOrderQuantity" : 22,
//                    "price" : 8.9900000000000002,
//                    "rating" : 4.3200000000000003,
//                    "returnPolicy" : "No return policy",
//                    "reviews" : [
//                        {
//                            "comment" : "Poor quality!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 2,
//                            "reviewerEmail" : "benjamin.wilson@x.dummyjson.com",
//                            "reviewerName" : "Benjamin Wilson"
//                        },
//                        {
//                            "comment" : "Great product!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 5,
//                            "reviewerEmail" : "liam.smith@x.dummyjson.com",
//                            "reviewerName" : "Liam Smith"
//                        },
//                        {
//                            "comment" : "Very unhappy with my purchase!",
//                            "date" : "2025-04-30T09:41:02.053Z",
//                            "rating" : 1,
//                            "reviewerEmail" : "clara.berry@x.dummyjson.com",
//                            "reviewerName" : "Clara Berry"
//                        }
//                    ],
//                    "shippingInformation" : "Ships overnight",
//                    "sku" : "BEA-NAI-NAI-005",
//                    "stock" : 79,
//                    "tags" : [
//                        "beauty",
//                        "nail polish"
//                    ],
//                    "thumbnail" : "https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/thumbnail.webp",
//                    "title" : "Red Nail Polish",
//                    "warrantyInformation" : "1 month warranty",
//                    "weight" : 8
//                }
//            ],
//            "skip" : 0,
//            "total" : 194
//        }
//    }
//    
//    
//}
