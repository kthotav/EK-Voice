//
//  DetailsTableViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/3/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import Firebase

class NotesTableViewController: UITableViewController {
//    
//    var details = NSDictionary()
//    var refNo:Int?
//    
//    var notes = [String]()
//    var dates = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        loadNotes()
//        self.tableView.reloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return notes.count
//    }
//
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("note", forIndexPath: indexPath)
//        
//        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.text = notes[indexPath.row]
//        
//
//        // Configure the cell...
//
//        return cell
//    }
//    
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "addNotes" {
//            let nav = segue.destinationViewController as! UINavigationController
//            let addNotesViewController = nav.topViewController as! AddNotesViewController
//            addNotesViewController.no = refNo!
//        }
//    }
//    
//    
//    func loadNotes() {
//        var recentNotes = [String]()
//        var recentDates = [String]()
//        if let notesArray = details.valueForKey("notes") as? NSArray {
//            for notes in notesArray {
//                if let note = notes["notetext"] {
//                    let unwrappedNote = note!
//                    recentNotes.append(unwrappedNote as! String)
//                    
//                } else {
//                    print ("note does not eixst")
//                }
//                
//                if let date = notes["date"] {
//                    let unwrappedDate = date!
//                    recentDates.append(unwrappedDate as! String)
//                }
//            }
//            
//        } else {
//            print ("no notes")
//        }
//        
//        self.notes = recentNotes
//        self.dates = recentDates
//        // self.tableView.reloadData()
//        
//    }
//    
//    @IBAction func cancelNotesViewController(segue:UIStoryboardSegue) {
//    }
//    
//    @IBAction func saveNotesViewControlle(segue:UIStoryboardSegue) {
//        
//       
//        
//        
//        let url = "https://ekvoicetext.firebaseio.com/"+"\(refNo!)"
//        let ref = Firebase(url: url);
//        let newNote =  ["date": "2015-11-15 11:15:38", "notetext": "\(newNoteText)", "user": "karthik"]
//        let notesRef = ref.childByAppendingPath("notes")
//        notesRef.childByAppendingPath("\(notes.count)").setValue(newNote)
//        
//    
//        //add the new note to the players array
//        notes.append(newNote["notetext"]!)
//        
//        //update the tableView
//        let indexPath = NSIndexPath(forRow: notes.count-1, inSection: 0)
//        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            
//    
//
//    }
//    


}
