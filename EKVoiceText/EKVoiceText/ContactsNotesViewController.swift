//
//  ContactsNotesViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/14/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import PagingMenuController




class ContactsNotesViewController: UIViewController, PagingMenuControllerDelegate {
    
    // MARK: - Fields
    var rowID: Int?
    var clientInfo = NSDictionary()
    let blueColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = clientInfo["last_name"] as? String
        
        let contactsTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsTableViewController") as! ContactsTableViewController
        contactsTableViewController.contactsID = rowID
        contactsTableViewController.contactsInfo = clientInfo
        contactsTableViewController.title = "Contacts"
        let recentNotesTableController = self.storyboard?.instantiateViewControllerWithIdentifier("RecentNotesTableViewController") as! RecentNotesTableViewController
        recentNotesTableController.notesID = rowID
        recentNotesTableController.notesInfo = clientInfo
        recentNotesTableController.title = "Notes"
    
        
        let viewControllers = [contactsTableViewController, recentNotesTableController]
        
        let options = PagingMenuOptions()
        options.menuHeight = 50
        options.selectedTextColor = blueColor
        options.menuDisplayMode = .Standard(widthMode: .Flexible, centerItem: true, scrollingMode: .PagingEnabled)
        options.menuItemMode = .Underline(height: 1, color: blueColor, horizontalPadding: 0, verticalPadding: 0)
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
    }
    
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        
    }
    
 
}

