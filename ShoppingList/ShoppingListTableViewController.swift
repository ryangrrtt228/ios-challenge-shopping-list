//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Batman on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    static let sharedController = ShoppingListTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingController.sharedController.incompletedItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        let item = ShoppingController.sharedController.incompletedItems[indexPath.row]
        cell.updateCellWithTask(item)
        return cell
        
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        var inputTextField: UITextField?
        
        let alert = UIAlertController(title: "Shopping List", message: "Add items to your list.", preferredStyle: UIAlertControllerStyle.Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (_) in
            if let inputTextField = inputTextField,
                title = inputTextField.text {
                ShoppingController.sharedController.createItem(title, isComplete: false)
                self.tableView.reloadData()
        
            }
        }
        alert.addAction(saveAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alert.addTextFieldWithConfigurationHandler ({ (textField) in
            inputTextField = textField
        })
        self.presentViewController(alert, animated: true, completion: nil)
        ShoppingController.sharedController.saveToPersistentStorage()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = ShoppingController.sharedController.incompletedItems[indexPath.row]
            ShoppingController.sharedController.deleteItem(item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}
