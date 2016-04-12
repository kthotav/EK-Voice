//
//  DemographicsViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/4/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class DemographicsViewController: UIViewController {

    var demographics = NSDictionary()
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var claimNo: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var phoneNumDisplay: String = (demographics["phone"] as? String)!
        var index = phoneNumDisplay.startIndex.advancedBy(0)
        phoneNumDisplay.insert("(", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(4)
        phoneNumDisplay.insert(")", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(5)
        phoneNumDisplay.insert(" ", atIndex: index)
        index = phoneNumDisplay.startIndex.advancedBy(9)
        phoneNumDisplay.insert("-", atIndex: index)
        phoneButton.setTitle(phoneNumDisplay, forState: .Normal)
        
        let addr1 = demographics["addr1"] as? String
        let addr2 = demographics["addr2"] as? String
        let city = demographics["city"] as? String
        let state = demographics["state"] as? String
        let zip = demographics["zip"] as? String
        
        address.text = addr1! + ". " + addr2!
        address2.text = city! + " " + state! + " " + zip!
        
         claimNo.text = demographics["claim_no"] as? String
        
        
        
    }

    @IBAction func phoneButtonPressed(sender: UIButton) {
        let phoneNumber:String = (demographics["phone"] as? String)!
        let url:NSURL = NSURL(string: "tel://" + phoneNumber)!
        UIApplication.sharedApplication().openURL(url)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
