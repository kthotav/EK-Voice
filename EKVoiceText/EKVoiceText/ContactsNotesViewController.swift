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
    let whiteColor = UIColor.whiteColor()
    let blueColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
    let grayColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.title = clientInfo["last_name"] as? String
        
//        let contactsTableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsTableViewController") as! ContactsTableViewController
//        contactsTableViewController.contactsID = rowID
//        contactsTableViewController.contactsInfo = clientInfo
//        contactsTableViewController.title = "Contacts"
        
        
        let mainTableController = self.storyboard?.instantiateViewControllerWithIdentifier("MainTableViewController") as! MainTableViewController
        mainTableController.contactsID = rowID
        mainTableController.contactsInfo = clientInfo
        mainTableController.title = "Contacts"
        
        let recentNotesTableController = self.storyboard?.instantiateViewControllerWithIdentifier("RecentNotesTableViewController") as! RecentNotesTableViewController
        recentNotesTableController.notesID = rowID
        recentNotesTableController.notesInfo = clientInfo
        recentNotesTableController.title = "Notes"
        
       
        
    
        
        let viewControllers = [mainTableController, recentNotesTableController]
        
        let options = PagingMenuOptions()
        options.menuHeight = 50
        options.selectedTextColor = blueColor
        options.menuDisplayMode = .Standard(widthMode: .Flexible, centerItem: true, scrollingMode: .PagingEnabled)
        options.menuItemMode = .Underline(height: 1, color: blueColor, horizontalPadding: 0, verticalPadding: 0)
        options.backgroundColor = grayColor
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
        
        self.tabBarController?.tabBar.barTintColor = whiteColor
                
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
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
 
}

