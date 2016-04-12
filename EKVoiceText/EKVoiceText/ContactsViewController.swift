//
//  ContactsViewController.swift
//  EKVoiceText
//
//  Created by Lou George on 4/5/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    
    var contacts = NSDictionary()
    
    @IBOutlet weak var contactEmail: UILabel!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contactEmail.text = contacts["attorney_email"] as? String
        
        var phoneNumDisplay: String = (contacts["attorney_phone"] as? String)!
        var index = phoneNumDisplay.startIndex.advancedBy(0)
        phoneNumDisplay.insert("(", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(4)
        phoneNumDisplay.insert(")", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(5)
        phoneNumDisplay.insert(" ", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(9)
        phoneNumDisplay.insert("-", atIndex: index)
        phoneButton.setTitle(phoneNumDisplay, forState: .Normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func phonePressed(sender: UIButton) {
        let phoneNumber:String = (contacts["attorney_phone"] as? String)!
        let url:NSURL = NSURL(string: "tel://" + phoneNumber)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
