//
//  CasesListTableViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 3/30/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase


class CasesListTableViewController: UITableViewController {

    var clients = [String]()
    var claims = [String]()
    
    var items = [NSDictionary]()
    
    let whiteColor = UIColor.whiteColor()
    
    // Create a reference to a Firebase location
    var myRootRef = Firebase(url:"https://ekvoicetext.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [NSDictionary]()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = whiteColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // call pareDataCareJSON()
        // parseDataCareJSON()
     
        
        loadDataFromFirebase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - praseDataCareJSON using SwiftyJOSN
    func parseDataCareJSON() {
        if let path = NSBundle.mainBundle().pathForResource("DataCareJSON", ofType: "json")
        {
            do {
                let pathAsData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let json = JSON(data: pathAsData)
                //If json is .Dictionary
                for (_,subJson):(String, JSON) in json {
                    if let clientNames = subJson["last_name"].string {
                        clients.append(clientNames)
                    }
                    if let claimNums = subJson["claim_no"].string {
                        claims.append(claimNums)
                    }
                    
                }
                
            } catch{
                print("JSON Data not Parsed!")
            }
            
        }
    }
 
    */ 
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("clientName", forIndexPath: indexPath)
        let dict = items[indexPath.row]
        cell.textLabel?.text = dict["last_name"] as? String
        cell.detailTextLabel?.text = dict["claim_no"] as? String

        return cell
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
        if segue.identifier == "clientDetail" {
            let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow!
            let clientDetailViewController = segue.destinationViewController as! ClientDetailViewController
            clientDetailViewController.clientInfo = self.items[indexPath.row]
        }
       

        
        
    }
    
    
    
    
    
    // MARK:- Load data from Firebase
    
    func loadDataFromFirebase() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        myRootRef.observeEventType(.Value, withBlock: { snapshot in
            var tempItems = [NSDictionary]()
            
            for item in snapshot.children {
                let child = item as! FDataSnapshot
                let dict = child.value as! NSDictionary
                tempItems.append(dict)
            }
            
            self.items = tempItems
            self.tableView.reloadData()
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
        })
    }

}
