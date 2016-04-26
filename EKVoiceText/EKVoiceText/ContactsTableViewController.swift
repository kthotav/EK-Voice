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
    
    // MARK: - UI Fileds
    let whiteColor = UIColor.whiteColor()
    let blueColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        contacts.append(contactsInfo["attorney_name"]! as! String)
        contacts.append(contactsInfo["carrier_contact_name"]! as! String)
        contacts.append(contactsInfo["primary_md_name"]! as! String)
        
        self.navigationController?.navigationBar.barTintColor = blueColor
        self.navigationController?.navigationBar.tintColor = whiteColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
        // self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        // self.navigationController?.navigationBar.translucent = true
        
        // self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.tabBarController?.tabBar.barTintColor = whiteColor
        
        
        
        // self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
//        let backgroundImage = UIImage(named: "background")
//        let imageView = UIImageView(image: backgroundImage)
//        self.tableView.backgroundView = imageView
//        imageView.contentMode = .ScaleAspectFill
        
        
      

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
        return contacts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = contacts[indexPath.row]
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
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
