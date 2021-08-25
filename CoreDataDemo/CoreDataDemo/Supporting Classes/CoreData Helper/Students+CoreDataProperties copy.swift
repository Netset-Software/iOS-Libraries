//
//  Students+CoreDataProperties.swift
//  
//
//  Created by netset on 20/08/21.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var rollNo: String?

}
