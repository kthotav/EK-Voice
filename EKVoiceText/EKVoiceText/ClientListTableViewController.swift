//
//  ClientListTableViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/13/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import Firebase
import SwiftSpinner

class ClientListTableViewController: UITableViewController {

    // MARK: - Outlets
    
    
    // MARK: - UI Fileds
    let whiteColor = UIColor.whiteColor()
    let blueColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
    

    // MARK: - Firebase Fields
    var myRootRef = Firebase(url:"https://ekvoicetext.firebaseio.com")
    var jsonData = [NSDictionary]()
    
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // settings for nav bar UI
        self.navigationController?.navigationBar.barTintColor = blueColor
        self.navigationController?.navigationBar.tintColor = whiteColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
      
        
        self.tabBarController?.tabBar.barTintColor = whiteColor
    
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
       
        SwiftSpinner.show("Loading...")
        
        loadFirebaseData()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        SwiftSpinner.hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jsonData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("clientNameCell", forIndexPath: indexPath) as! ClientNameTableViewCell
        let json = jsonData[indexPath.row]
        cell.nameLable.text = json["last_name"] as? String
        cell.claimNoLabel.text = json["claim_no"] as? String
        
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
       
    

        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = .clearColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        SwiftSpinner.show("Loading...")
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "showClientDetails" {
            
            let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow!
            let clientContactsNotesViewController = segue.destinationViewController as! ContactsNotesViewController
            clientContactsNotesViewController.rowID = Int(indexPath.row)
            clientContactsNotesViewController.clientInfo = self.jsonData[indexPath.row]        }
    }
 
    
    // MARK: - Logout Action Button
    @IBAction func logoutbuttonAction(sender: UIBarButtonItem) {
        self.view.window!.rootViewController?.dismissViewControllerAnimated(false, completion: nil)
    }
    
    // MARK: - Load Firebase data
    func loadFirebaseData() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        myRootRef.observeEventType(.Value, withBlock: { snapshot in
            var jsonDataTemp = [NSDictionary]()
            
            for data in snapshot.children {
                let child = data as! FDataSnapshot
                let dict = child.value as! NSDictionary
                jsonDataTemp.append(dict)
            }
            
            self.jsonData = jsonDataTemp
            self.tableView.reloadData()
            
            
            
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
        })
    }
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

}
