//
//  StorageManager.swift
//  ToDoListApp
//
//  Created by Иван on 10/3/20.
//  Copyright © 2020 Ivan Savkov. All rights reserved.
//

import Foundation
import CoreData

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "ToDoListApp")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    static func deleteObject(_ task: Task) {
        let context = persistentContainer.viewContext
        context.delete(task)
    }
}
