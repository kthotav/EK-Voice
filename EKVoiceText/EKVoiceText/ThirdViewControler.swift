//
//  ThirdViewControler.swift
//  EKVoiceText
//
//  Created by Karthik on 2/27/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class ThirdViewControler: UIViewController, UITableViewDelegate {
    
    let caseItems = ["Case1", "Case2"]
    
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
            return caseItems.count
        }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
    
             cell.textLabel?.text = caseItems[indexPath.row]
    
            return cell
        }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetail", sender: self)
    }

}
