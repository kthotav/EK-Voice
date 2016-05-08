//
//  NotesdetailViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 5/2/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

class NotesdetailViewController: UIViewController {

    var noteDetail:String = ""
    @IBOutlet weak var notesDetail: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notesDetail.text = noteDetail
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
