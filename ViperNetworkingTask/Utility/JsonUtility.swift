//
//  JsonUtility.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 25/04/26.
//

import Foundation
import UIKit

enum JsonError: Error {
    case DataNotFound
    case DataDecodingError
}

struct JsonUtility {
    
    static let shared = JsonUtility()
    
    func jsonToModel<T: Codable>(filename: String) throws -> T {
        
        // Load the json file
        
//        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
//            print("File \(filename) not found on url")
//            return nil
//        }        
        
        let dataAsset = NSDataAsset(name: filename)
        guard let data = dataAsset?.data else {
            print("\(filename) data not found in Assets")
            throw JsonError.DataNotFound
        }
                
//        do {
            // Convert it into data
//            let data = try Data(contentsOf: )
         
            // Convert into Model
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601
    //        decoder.dataDecodingStrategy = .deferredToData
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                #if DEBUG
                print("Error decoding JSON: \(error)")
                #endif
                throw JsonError.DataDecodingError
            }
//        } catch {
//            #if DEBUG
//            print("Error in Converting JSON into Data: \(error)")
//            #endif
//            return nil
//        }
    }
    
    func jsonToModel<T: Codable>(_ date: Data, _ type: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        decoder.dateDecodingStrategy = .custom({ decoder in  //.iso8601
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFractionalSeconds, .withInternetDateTime]
            if let date = formatter.date(from: dateString) {
                return date
            }
            
            formatter.formatOptions = [.withInternetDateTime]
            if let date = formatter.date(from: dateString) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format: \(dateString)")
        })
        
        do {
            return try decoder.decode(type, from: date)
        } catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }
    
}
