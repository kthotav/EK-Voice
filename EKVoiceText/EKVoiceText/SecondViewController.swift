//
//  SecondViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 2/21/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            // display in alert view
        }
       
        let url = NSURL(string:"https://www.datacareservices.com/dcarecorp")!
        webView.loadRequest(NSURLRequest(URL: url))
        
    }

}
