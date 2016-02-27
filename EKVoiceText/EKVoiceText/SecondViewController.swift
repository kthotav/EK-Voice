//
//  SecondViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 2/21/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {
    
    let navigationItems = ["Home", "Appointments", "Cases", "CommCenter", "Contacts", "Medical Data", "My Account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            // display in alert view
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
         cell.textLabel?.text = navigationItems[indexPath.row]
        
        return cell
    }
    
    

  
}
