//
//  ReviewModel+CoreDataProperties.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 11/05/26.
//
//

public import Foundation
public import CoreData


public typealias ReviewModelCoreDataPropertiesSet = NSSet

extension ReviewModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReviewModel> {
        return NSFetchRequest<ReviewModel>(entityName: "ReviewModel")
    }

    @NSManaged public var comment: String?
    @NSManaged public var date: Date?
    @NSManaged public var rating: Int64
    @NSManaged public var reviewerEmail: String?
    @NSManaged public var reviewerName: String?

}

extension ReviewModel : Identifiable {

}
