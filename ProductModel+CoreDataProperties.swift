//
//  ProductModel+CoreDataProperties.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 11/05/26.
//
//

public import Foundation
public import CoreData


public typealias ProductModelCoreDataPropertiesSet = NSSet

extension ProductModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductModel> {
        return NSFetchRequest<ProductModel>(entityName: "ProductModel")
    }

    @NSManaged public var brand: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: Int64
    @NSManaged public var images: NSArray?
    @NSManaged public var price: Double
    @NSManaged public var rating: Double
    @NSManaged public var returnPolicy: String?
    @NSManaged public var stock: Int64
    @NSManaged public var thumbnail: URL?
    @NSManaged public var title: String?
    @NSManaged public var relationship: ReviewModel?

}

extension ProductModel : Identifiable {

}
