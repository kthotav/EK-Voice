//
//  ViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 2/16/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit

var lmPath: String!
var dicPath: String!
var words: Array<String> = []
var currentWord: String!

var kLevelUpdatesPerSecond = 18

class ViewController: UIViewController, OEEventsObserverDelegate {

    var openEarsEventsObserver = OEEventsObserver()
    var startupFailedDueToLackOfPermissions = Bool()
    
    var buttonFlashing = false
    
    @IBOutlet weak var heardTextView: UITextView!
    @IBOutlet weak var statusTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadOpenEars()
    }

    
    @IBAction func record(sender: AnyObject) {
        startListening()

        
    }
    
    @IBAction func stop(sender: AnyObject) {
       stopListening()
    }

    
    //OpenEars methods begin
    
    func loadOpenEars() {
        
        self.openEarsEventsObserver = OEEventsObserver()
        self.openEarsEventsObserver.delegate = self
        
        let lmGenerator: OELanguageModelGenerator = OELanguageModelGenerator()
        
        addWords()
        let name = "LanguageModelFileStarSaver"
        lmGenerator.generateLanguageModelFromArray(words, withFilesNamed: name, forAcousticModelAtPath: OEAcousticModel.pathToModel("AcousticModelEnglish"))
        
        lmPath = lmGenerator.pathToSuccessfullyGeneratedLanguageModelWithRequestedName(name)
        dicPath = lmGenerator.pathToSuccessfullyGeneratedDictionaryWithRequestedName(name)
    }
    
    
    func pocketsphinxDidStartListening() {
        print("Pocketsphinx is now listening.")
        statusTextView.text = "Pocketsphinx is now listening."
    }
    
    func pocketsphinxDidDetectSpeech() {
        print("Pocketsphinx has detected speech.")
        statusTextView.text = "Pocketsphinx has detected speech."
    }
    
    func pocketsphinxDidDetectFinishedSpeech() {
        print("Pocketsphinx has detected a period of silence, concluding an utterance.")
        statusTextView.text = "Pocketsphinx has detected a period of silence, concluding an utterance."
    }
    
    func pocketsphinxDidStopListening() {
        print("Pocketsphinx has stopped listening.")
        statusTextView.text = "Pocketsphinx has stopped listening."
    }
    
    func pocketsphinxDidSuspendRecognition() {
        print("Pocketsphinx has suspended recognition.")
        statusTextView.text = "Pocketsphinx has suspended recognition."
    }
    
    func pocketsphinxDidResumeRecognition() {
        print("Pocketsphinx has resumed recognition.")
        statusTextView.text = "Pocketsphinx has resumed recognition."
    }
    
    func pocketsphinxDidChangeLanguageModelToFile(newLanguageModelPathAsString: String, newDictionaryPathAsString: String) {
        print("Pocketsphinx is now using the following language model: \(newLanguageModelPathAsString) and the following dictionary: \(newDictionaryPathAsString)")
    }
    
    func pocketSphinxContinuousSetupDidFailWithReason(reasonForFailure: String) {
        print("Listening setup wasn't successful and returned the failure reason: \(reasonForFailure)")
        statusTextView.text = "Listening setup wasn't successful and returned the failure reason: \(reasonForFailure)"
    }
    
    func pocketSphinxContinuousTeardownDidFailWithReason(reasonForFailure: String) {
        print("Listening teardown wasn't successful and returned the failure reason: \(reasonForFailure)")
        statusTextView.text = "Listening teardown wasn't successful and returned the failure reason: \(reasonForFailure)"
    }
    
    func testRecognitionCompleted() {
        print("A test file that was submitted for recognition is now complete.")
        statusTextView.text = "A test file that was submitted for recognition is now complete."
    }
    
    func startListening() {
        //        OEPocketsphinxController.sharedInstance().setActive(true, error:nil)
        OEPocketsphinxController.sharedInstance().startListeningWithLanguageModelAtPath(lmPath, dictionaryAtPath: dicPath, acousticModelAtPath: OEAcousticModel.pathToModel("AcousticModelEnglish"), languageModelIsJSGF: false)
        
    }
    
    func stopListening() {
        OEPocketsphinxController.sharedInstance().stopListening()
    }
    
    func addWords() {
        //add any thing here that you want to be recognized. Must be in capital letters
        let str = "White male admitted ambulant from GI clinic with diagnosis epigastric pain. Complains of mild pain at present. No acure distress. Schedule for elective surgery."
        
        words  = str.componentsSeparatedByString(" ")
        //        print(myArray)
        //        for i in myArray {
        //            words.append(i)
        //        }
        //        words.append("SUNDAY")
        //        words.append("MONDAY")
        //        words.append("TUESDAY")
        //        words.append("WEDNESDAY")
        //        words.append("THURSDAY")
        //        words.append("FRIDAY")
        //        words.append("SATURDAY")
        //
        //        words.append("JANUARY")
        //        words.append("FEBRUARY")
        //        words.append("MARCH")
        //        words.append("APRIL")
        //        words.append("MAY")
        //        words.append("JUNE")
        //        words.append("JULY")
        //        words.append("AUGUST")
        //        words.append("SEPTEMBER")
        //        words.append("OCTOBER")
        //        words.append("NOVEMBER")
        //        words.append("DECEMBER")
    }
    
    func getNewWord() {
        let randomWord = Int(arc4random_uniform(UInt32(words.count)))
        currentWord = words[randomWord]
    }
    
    func pocketsphinxFailedNoMicPermissions() {
        
        NSLog("Local callback: The user has never set mic permissions or denied permission to this app's mic, so listening will not start.")
        self.startupFailedDueToLackOfPermissions = true
        if OEPocketsphinxController.sharedInstance().isListening {
            let error = OEPocketsphinxController.sharedInstance().stopListening() // Stop listening if we are listening.
            if(error != nil) {
                NSLog("Error while stopping listening in micPermissionCheckCompleted: %@", error);
            }
        }
    }
    
    func pocketsphinxDidReceiveHypothesis(hypothesis: String!, recognitionScore: String!, utteranceID: String!) {
        
        heardTextView.text = "\(heardTextView.text) \(hypothesis)"
    }
}




