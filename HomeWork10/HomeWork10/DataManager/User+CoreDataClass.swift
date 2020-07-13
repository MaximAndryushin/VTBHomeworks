//
//  User+CoreDataClass.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
//

import Foundation
import CoreData


public class User: NSManagedObject {
    convenience init() {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: DataManager.shared.managedObjectContext)
        
        self.init(entity: entity!, insertInto: DataManager.shared.managedObjectContext)
    }
}
