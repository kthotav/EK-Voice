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
    var clientNo: Int?
    
    var notes = [String]()
    var dates = [String]()
   
    
    
    @IBOutlet weak var demographicsView: UIView!
    @IBOutlet weak var contactsView: UIView!
    
    
    
    // Demographics
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = clientInfo["last_name"] as? String
        // self.tableView.reloadData()
   
        
        self.contactsView.hidden = true
       
        
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
//         if segue.identifier == "showClientNotes" {
//            
//             let notesViewController = segue.destinationViewController as! NotesTableViewController
//             notesViewController.details = clientInfo
//             notesViewController.refNo = clientNo
//         }
        if segue.identifier == "demographics" {
            
            let demographicsViewController = segue.destinationViewController as! DemographicsViewController
            demographicsViewController.demographics = clientInfo
        }
        
        if segue.identifier == "recentNotes" {
            
            let recentNotesViewController = segue.destinationViewController as! RecentNotes
            recentNotesViewController.recentnotes = clientInfo
            recentNotesViewController.refNo = clientNo
            
        }
    }
    
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.demographicsView.alpha = 1
                self.contactsView.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.contactsView.hidden = false
                self.demographicsView.alpha = 0
                self.contactsView.alpha = 1
            })
        }
    }
    
    
    
   

}
