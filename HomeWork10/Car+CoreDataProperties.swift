//
//  Car+CoreDataProperties.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var name: String?
    @NSManaged public var cost: Int32
    @NSManaged public var maxSpeed: Int32
    @NSManaged public var owner: User?

}
