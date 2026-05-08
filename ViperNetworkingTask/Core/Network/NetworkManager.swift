//
//  NetworkManager.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 22/04/26.
//

import Foundation

enum APIUrl {
    
    case baseURL
    case productList
    case productDetails(id: Int)
    
    var url: String {
        return switch self {
        case .baseURL:
            "https://dummyjson.com"
        
        case .productList:
            APIUrl.baseURL.url + "/products"
        
        case .productDetails(let id):
            APIUrl.baseURL.url + "/products" + "/\(id)"
        }
    }
    
}

enum AppError {
    enum NetworkError: String, Error {
        case InvalidURL
    }
    
    enum DecodingError: String, Error {
        case DataDecodingError
    }
}

//protocol NetworkManagerProtocol {
//    associatedtype Item: Codable
//    
//    func fetch<Item>(urlStr: APIUrl) async throws -> Item
//}

protocol NetworkManagerProtocol {
    func fetch<T: Codable>(urlStr: APIUrl) async throws -> T
}

struct MockNetworkManager: NetworkManagerProtocol {
//    typealias Item = [Product]
    
    func fetch<T: Codable>(urlStr: APIUrl) async throws -> T {
        try JsonUtility.shared.jsonToModel(filename: "products.json")
    }
}

struct NetworkManager: NetworkManagerProtocol {

    // Handle response code
    // it should support request body, header param, query param
    // it should support all types of error - server, client, data, url, token, auth
    // it should support retry, backoff, token refresh
    
    func fetch<T: Codable>(urlStr: APIUrl) async throws -> T {
        guard let url = URL(string: urlStr.url) else {
            throw AppError.NetworkError.InvalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        //        urlRequest.httpBody = Date()
        //        urlRequest.allHTTPHeaderFields
        //        urlRequest.timeoutInterval
        //        urlRequest.cachePolicy
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        Logger.log(String(data: data, encoding: .utf8), level: .DEBUG)
        
        if let model = JsonUtility.shared.jsonToModel(data, T.self) {
            return model
        } else {
            throw AppError.DecodingError.DataDecodingError
        }
    }
}
