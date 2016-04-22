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
    

    
}
