//
//  ButtonTableViewCell.swift
//  ShoppingList
//
//  Created by Batman on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: ButtonTableViewCell?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonTapped(self)
    }
        
        updateButton(true)
        
    }
    
    func updateButton(isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
            
        }
        
    }
        func updateCellWithTask(item: ShoppingList) {
            itemLabel.text = item.item
            updateButton(item.isComplete.boolValue)
            
        }
}

        
        protocol ButtonTableViewCellDelegate {
            func buttonCellButtonTapped(sender: ButtonTableViewCell)
}
