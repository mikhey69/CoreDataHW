//
//  Person+CoreDataProperties.swift
//  SavingData
//
//  Created by mikhey on 14.06.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
