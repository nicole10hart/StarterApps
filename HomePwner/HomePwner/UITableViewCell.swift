//
//  UITableViewCell.swift
//  HomePwner
//
//  Created by Hart, Nicole on 4/5/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumber: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumber.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
    func updateColorOfValue(value: Int) {
        if value < 50 {
            valueLabel.textColor = UIColor.green
        } else {
            valueLabel.textColor = UIColor.red
        }
    }
    
    
    
}
