//
//  ContactsTableViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/16/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit



class ContactsTableViewController: UITableViewController {

    // MARK: - Fields 
    var contactsID: Int?
    var contactsInfo = NSDictionary()
    var contacts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print (contactsInfo)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func loadContacts(){
        var contacts = [String]()
        // 0: attorney_name 
        // 1: attorney_email 
        // 2: attorney_phone
        // 3: carrier_contact_name
        // 4: carrier_contact_phone
        contacts.append((contactsInfo["attorney_name"] as? String)!)
        contacts.append((contactsInfo["attorney_email"] as? String)!)
        contacts.append((contactsInfo["attorney_phone"] as? String)!)
        contacts.append((contactsInfo["carrier_contact_name"] as? String)!)
        contacts.append((contactsInfo["carrier_contact_phone"] as? String)!)
        
        
        for (var i = 0; i < contacts.count; i += 1){
            if contacts[i] == ""{
                contacts[i] = "Not Provided"
            }
        }
        
        var attPhoneNumDisplay: String = formatNumber(contacts[2])
        var carPhoneNumDisplay: String = formatNumber(contacts[4])
        
        
    }
    
    func formatNumber(phone: String) -> String{
        var index = phone.startIndex.advancedBy(0)
        var ret: String = phone
        ret.insert("(", atIndex: index)
        index = ret.startIndex.advancedBy(4)
        ret.insert(")", atIndex: index)
        index = ret.startIndex.advancedBy(5)
        ret.insert(" ", atIndex: index)
        index = ret.startIndex.advancedBy(9)
        ret.insert("-", atIndex: index)
        return ret
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contacts", forIndexPath: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = contacts[indexPath.row]
        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
