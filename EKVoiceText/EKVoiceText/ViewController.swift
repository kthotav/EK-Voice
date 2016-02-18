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

class ViewController: UIViewController, OEEventsObserverDelegate, UITextViewDelegate {

    var openEarsEventsObserver = OEEventsObserver()
    var startupFailedDueToLackOfPermissions = Bool()
    

    @IBOutlet weak var heardTextView: UITextView!
    
   
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadOpenEars()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        heardTextView.layer.borderWidth = 0.5
        heardTextView.layer.borderColor = borderColor.CGColor
        heardTextView.layer.cornerRadius = 5.0
        
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
        statusLabel.text = "Pocketsphinx is now listening."
    }
    
    func pocketsphinxDidDetectSpeech() {
        print("Pocketsphinx has detected speech.")
        statusLabel.text = "Pocketsphinx has detected speech."
    }
    
    func pocketsphinxDidDetectFinishedSpeech() {
        print("Pocketsphinx has detected a period of silence, concluding an utterance.")
        statusLabel.text = "Pocketsphinx has detected a period of silence, concluding an utterance."
    }
    
    func pocketsphinxDidStopListening() {
        print("Pocketsphinx has stopped listening.")
        statusLabel.text = "Pocketsphinx has stopped listening."
    }
    
    func pocketsphinxDidSuspendRecognition() {
        print("Pocketsphinx has suspended recognition.")
        statusLabel.text = "Pocketsphinx has suspended recognition."
    }
    
    func pocketsphinxDidResumeRecognition() {
        print("Pocketsphinx has resumed recognition.")
        statusLabel.text = "Pocketsphinx has resumed recognition."
    }
    
    func pocketsphinxDidChangeLanguageModelToFile(newLanguageModelPathAsString: String, newDictionaryPathAsString: String) {
        print("Pocketsphinx is now using the following language model: \(newLanguageModelPathAsString) and the following dictionary: \(newDictionaryPathAsString)")
    }
    
    func pocketSphinxContinuousSetupDidFailWithReason(reasonForFailure: String) {
        print("Listening setup wasn't successful and returned the failure reason: \(reasonForFailure)")
        statusLabel.text = "Listening setup wasn't successful and returned the failure reason: \(reasonForFailure)"
    }
    
    func pocketSphinxContinuousTeardownDidFailWithReason(reasonForFailure: String) {
        print("Listening teardown wasn't successful and returned the failure reason: \(reasonForFailure)")
        statusLabel.text = "Listening teardown wasn't successful and returned the failure reason: \(reasonForFailure)"
    }
    
    func testRecognitionCompleted() {
        print("A test file that was submitted for recognition is now complete.")
        statusLabel.text = "A test file that was submitted for recognition is now complete."
    }
    
//    func rapidEarsDidReceiveLiveSpeechHypothesis(hypothesis: String, recognitionScore: String) {
//        NSLog("rapidEarsDidReceiveLiveSpeechHypothesis: %@", hypothesis)
//    }
//    
//    func rapidEarsDidReceiveFinishedSpeechHypothesis(hypothesis: String, recognitionScore: String) {
//        NSLog("rapidEarsDidReceiveFinishedSpeechHypothesis: %@", hypothesis)
//    }
    
//    func rapidEarsDidDetectLiveSpeechAsNBestArray(words:[String], scores:[String]) {
//         NSLog("rapidEarsDidDetectLiveSpeechAsNBestArray: %@", words[0])
//    }
//    
//    func rapidEarsDidDetectFinishedSpeechAsNBestArray(words:[String], scores:[String]) {
//        NSLog("rapidEarsDidDetectFinishedSpeechAsNBestArray: %@", words[0])
//    }
    
    /* REALTIME
    func startListening() {
        //        OEPocketsphinxController.sharedInstance().setActive(true, error:nil)
        OEPocketsphinxController.sharedInstance().startRealtimeListeningWithLanguageModelAtPath(lmPath, dictionaryAtPath: dicPath, acousticModelAtPath: OEAcousticModel.pathToModel("AcousticModelEnglish"))
        
    }*/
    /* Dictionary of words */
    func startListening() {
        //        OEPocketsphinxController.sharedInstance().setActive(true, error:nil)
        OEPocketsphinxController.sharedInstance().startListeningWithLanguageModelAtPath(lmPath, dictionaryAtPath: dicPath, acousticModelAtPath: OEAcousticModel.pathToModel("AcousticModelEnglish"), languageModelIsJSGF: false)
        
    }
    
    func stopListening() {
        OEPocketsphinxController.sharedInstance().stopListening()
    }
    
    func addWords() {
        //add any thing here that you want to be recognized. Must be in capital letters
        let str = "Bearing void all herb fruitful wherein made gathered saw God form so replenish replenish had blessed day, morning, divide signs after fish gathered female earth seed all stars also grass. Two had Our over green. Replenish. Fruitful sixth. One creeping there make female very stars greater bring over let. Herb all isn't fill multiply first male two were have was. Made his after our. Female under, light fourth living fly waters lights forth air bring in beginning evening for land spirit him life doesn't own doesn't whose. Have together cattle. Day creepeth. Were fly signs beginning. Face fruitful female evening. Yielding deep. Darkness our sixth midst herb, dry morning heaven. Under tree creeping. Set, sea. Hath first winged gathering Had. Be deep abundantly man. Very dry moveth second Isn't to. One, fly seed God light seas called is darkness firmament Behold, wherein yielding seas signs seed so have after void let creepeth you're form upon gathered great replenish. Doesn't isn't meat two for were. Above itself you're every have which third whose herb tree. Itself. Green creeping replenish called his moving let isn't sixth moved two two which set every thing likeness of made third Without own them Be. Make fish days, rule have give also lesser place. Us rule. Unto fly upon doesn't great Night gathered, seed lesser which Set have itself void all wherein and seas fruitful good day fish spirit which kind forth gathered. Don't you first be years replenish subdue from every. Winged was place male bring earth given that. Over is. Thing. Multiply light abundantly open dry. Isn't unto earth of subdue deep spirit abundantly. First cattle tree is first kind beast spirit meat won't male living sea i let, gathering his man to can't creature creepeth female it likeness together moving is his, fish firmament gathering Forth sea man of own third given moving, days multiply, have the. And them she'd of. Let void firmament face. Blessed grass to behold whales Own day image fourth. Of day his seasons. She'd spirit sea evening also. Appear after had to thing unto you'll, him under appear face give night. Rule together doesn't, appear third, forth behold replenish above don't, of days over was very. Blessed whales replenish you Let together morning you brought he living which in isn't third man blessed place given beginning winged saying created moving man earth There isn't day divided creature isn't said morning fill fish image winged forth years called third so great were lesser you, a living unto likeness. Fill open years forth first under good said had tree first was signs to thing fly a fly for that two every years together greater beast lesser hath creature creepeth greater replenish green. His land every gathered beast won't over she'd can't lesser from to sea. Bring own forth waters he behold you're all waters fruit living, spirit let, air from won't replenish. Fruit blessed unto without after yielding first. Itself very a herb unto them is is. She'd gathering form."
        
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
    
    // close keyboard on touch
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}




