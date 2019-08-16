//
//  SWAPICharacter+Convenience.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/16/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

extension SWCharacter {
    convenience init(name: String, height: String, birth_year: String, managedObjectContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: managedObjectContext)
        
    }
    
    // convenience init from "representation"
}
