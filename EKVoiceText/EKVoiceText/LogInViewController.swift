//
//  LogInViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 2/24/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//


import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func logInAction(sender: AnyObject) {
        if userNameField.text == "Karthik" && passwordField.text == "hello123" {
            self.performSegueWithIdentifier("tabViewController", sender: self)
        }
        
    }

}
