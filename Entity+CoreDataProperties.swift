//
//  Entity+CoreDataProperties.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var dob: String?
    @NSManaged public var phone: Int16
    @NSManaged public var image: Data?
    @NSManaged public var imagesign: Data?
    

}

extension Entity : Identifiable {

}
