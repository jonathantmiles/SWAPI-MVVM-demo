//
//  CoreDataStack.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/16/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Star Wars MVVM demo")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    } ()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
