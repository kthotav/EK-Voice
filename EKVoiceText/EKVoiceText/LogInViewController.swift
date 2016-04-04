//
//  LogInViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 2/24/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//


import UIKit
import LocalAuthentication

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK:-  username and password textfield
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    // MARK:- login button
 
    @IBAction func logInAction(sender: AnyObject) {
        
        if userNameField.text == "Karthik" && passwordField.text == "hello123" {
            
            
            let authentication  = LAContext()
            var error: NSError?
            
            authentication.localizedFallbackTitle = ""
            
            if authentication.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
                
                authentication.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch ID") { (success, error) -> Void in
                    if success {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.performSegueWithIdentifier("tabViewController", sender: self)
                        })
                        
                    } else {
                        if let error = error {
                            switch error.code {
                                case LAError.SystemCancel.rawValue:
                                    print("Authentication was cancelled by the system.")
                                case LAError.UserCancel.rawValue:
                                    print("Authentication was cancelled by the user.")
                                default:
                                    print("Authentication failed.")
                            }
                        } else {
                            
                        }
                    }
                }
            } else {
                self.performSegueWithIdentifier("tabViewController", sender: self)
            }
            
        }
    }
    
   
    // MARK:- close keybaord
    // closes when user taps the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    


}
