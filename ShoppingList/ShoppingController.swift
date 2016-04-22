//
//  ShoppingController.swift
//  ShoppingList
//
//  Created by Batman on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingController {
    
    static let sharedController = ShoppingController()
    
    var shoppingLists: [ShoppingList] {
        let context = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "ShoppingList")
        let shoppingList = (try? context.executeFetchRequest(request)) as? [ShoppingList]
        print(ShoppingList)
        return shoppingList ?? []
    }
    
    var completedItems: [ShoppingList] {
        return shoppingLists.filter({($0.isComplete.boolValue)})
    }
    
    var incompletedItems: [ShoppingList] {
        return shoppingLists.filter({(!(($0.isComplete.boolValue)))})
        
    }
    
    func createItem(item: String, isComplete: Bool) {
        let _ = ShoppingList(item: item, isComplete: false)
        saveToPersistentStorage()
        
        
    }
    
    func deleteItem(shoppingLists: ShoppingList) {
        shoppingLists.managedObjectContext?.deleteObject(shoppingLists)
        saveToPersistentStorage()
        
    }
    
    func saveToPersistentStorage() {
        do{
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Could Not Save")
        }
    }
}