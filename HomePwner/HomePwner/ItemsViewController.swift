//
//  ItemsViewController.swift
//  HomePwner
//
//  Created by Hart, Nicole on 4/4/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell2", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        if item.valueInDollars > Int(50) {
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            return cell
        } else {
            cell2.textLabel?.text = item.name
            cell2.detailTextLabel?.text = "$\(item.valueInDollars)"
            return cell2
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}
