//
//  RecentNotes.swift
//  EKVoiceText
//
//  Created by Karthik on 3/4/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class RecentNotes: UIViewController, UITableViewDelegate {
    
    var cellTapped: Bool = true
    var currentRow = 0
    
    
    
    var notesDates = ["03/04/2016", "03/02/2016", "02/28/2016", "02/20/2016", "02/18/2016", "02/12/2016", "02/8/2016", "01/29/2016", "01/23/2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Table View Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesDates.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "notesList")
        
        cell.textLabel?.text = notesDates[indexPath.row]
        
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
    
    

}
