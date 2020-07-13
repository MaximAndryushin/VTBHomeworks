//
//  UserDefaultDataManager.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
import Foundation
import CoreData

class DataManager {
    
    //MARK: ~Constants
    
    //Singltone
    static let shared = DataManager()
    
    private init() {}
    
    // MARK: - Core Data stack

     lazy var persistentContainer: NSPersistentContainer = {
         /*
          The persistent container for the application. This implementation
          creates and returns a container, having loaded the store for the
          application to it. This property is optional since there are legitimate
          error conditions that could cause the creation of the store to fail.
         */
         let container = NSPersistentContainer(name: "HomeWork10")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                  
                 /*
                  Typical reasons for an error here include:
                  * The parent directory does not exist, cannot be created, or disallows writing.
                  * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                  * The device is out of space.
                  * The store could not be migrated to the current model version.
                  Check the error message to determine what the actual problem was.
                  */
                 fatalError("Unresolved error \(error), \(error.userInfo)")
             }
         })
         return container
     }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()

     // MARK: - Core Data Saving support

    func saveContext () {
         let context = persistentContainer.viewContext
         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
             }
         }
     }
    
    //MARK: ~Methods
    
    func saveUser(_ name: String, password: String) {
        let newUser = User()
        newUser.name = name
        newUser.password = password
        newUser.authentificated = false
        saveContext()
    }
    
    func getUser() -> User! {
        let fetchRequest = User.userFetchRequest()
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            if !results.isEmpty {
                return results.first
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func authenficate() {
        let user = getUser()
        user!.authentificated = true
        saveContext()
    }
    
    func deauthenficate() {
        if let user = getUser() {
            user.authentificated = false
            saveContext()
        }
    }
    
    func isAuthenficated() -> Bool {
        if let user = getUser() {
            return user.authentificated
        }
        return false
    }
    
    func deleteAllInstancesOf(entity: String) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedObjectContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func clearUserData() {
        deleteAllInstancesOf(entity: "User")
        deleteAllInstancesOf(entity: "Car")
    }
    
    func fetchedResultsController(entityName: String, keyForSort: String) -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: keyForSort, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
}
