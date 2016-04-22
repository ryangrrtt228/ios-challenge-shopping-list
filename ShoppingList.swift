//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by Batman on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class ShoppingList: NSManagedObject {

    convenience init(item: String, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext){
      let entity = NSEntityDescription.entityForName("ShoppingList", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.item = item
        self.isComplete = false
    
    
    }
}
