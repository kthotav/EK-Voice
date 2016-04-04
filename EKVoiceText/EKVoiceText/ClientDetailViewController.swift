//
//  ClientDetailViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/3/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase

class ClientDetailViewController: UIViewController, UITableViewDelegate {

    var clientInfo = NSDictionary()
    var notes = [String]()
    var dates = [String]()
   
    @IBOutlet weak var displayInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = clientInfo["last_name"] as? String
        // self.tableView.reloadData()
        let client = String(clientInfo)
        displayInfo.text = client
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
         if segue.identifier == "showClientNotes" {
            
             let notesViewController = segue.destinationViewController as! NotesTableViewController
             notesViewController.details = clientInfo
         }
    }
    
    
   

}
