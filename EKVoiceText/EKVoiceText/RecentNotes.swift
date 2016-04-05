//
//  RecentNotes.swift
//  EKVoiceText
//
//  Created by Karthik on 3/4/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import Firebase

class RecentNotes: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recentnotes = NSDictionary()
    var refNo:Int?
    
    var notes = [String]()
    var dates = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    var cellTapped: Bool = true
    var currentRow = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Table View Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("note", forIndexPath: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = notes[indexPath.row]
        
        
        // Configure the cell...
        
        return cell
        
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let selectedRowIndex = indexPath
//        currentRow = selectedRowIndex.row
//        
//        tableView.beginUpdates()
//        tableView.endUpdates()
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        if indexPath.row == currentRow {
//            if cellTapped == false {
//                cellTapped = true
//                return 141
//            } else {
//                cellTapped = false
//                return 70
//            }
//        }
//       
//        return 70
//    }
    
    func loadNotes() {
        var recentNotes = [String]()
        var recentDates = [String]()
        if let notesArray = recentnotes.valueForKey("notes") as? NSArray {
            for notes in notesArray {
                if let note = notes["notetext"] {
                    let unwrappedNote = note!
                    recentNotes.append(unwrappedNote as! String)
                    
                } else {
                    print ("note does not eixst")
                }
                
                if let date = notes["date"] {
                    let unwrappedDate = date!
                    recentDates.append(unwrappedDate as! String)
                }
            }
            
        } else {
            print ("no notes")
        }
        
        self.notes = recentNotes
        self.dates = recentDates
        
    }
    
    @IBAction func cancelNotesViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveNotesViewControlle(segue:UIStoryboardSegue) {
        
        
        
        
        let url = "https://ekvoicetext.firebaseio.com/"+"\(refNo!)"
        let ref = Firebase(url: url);
        let newNote =  ["date": "2015-11-15 11:15:38", "notetext": "\(newNoteText)", "user": "karthik"]
        let notesRef = ref.childByAppendingPath("notes")
        notesRef.childByAppendingPath("\(notes.count)").setValue(newNote)
        
        
        //add the new note to the players array
        notes.append(newNote["notetext"]!)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: notes.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        
        
        
        
    }
    
    

}
