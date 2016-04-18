//
//  UserLoginViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/12/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import LocalAuthentication

class UserLoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Login Button Acion
    @IBAction func loginbuttonAction(sender: UIButton) {
        
        if usernameTextField.text == "Karthik" && passwordTextField.text == "hello123" {
            
            // source: ios udemey course
            let authentication  = LAContext()
            var error: NSError?
            
            authentication.localizedFallbackTitle = ""
            
            if authentication.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
                
                // prompt touchid 
                authentication.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch ID") { (success, error) -> Void in
                    if success {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.performSegueWithIdentifier("showcases", sender: self)
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
                self.performSegueWithIdentifier("showcases", sender: self)
            }
            
        }
    }
    
    
    // MARK:- close keybaord
    // closes when user taps the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
