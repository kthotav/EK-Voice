//
//  AddNotesViewController.swift
//  EKVoiceText
//
//  Created by Karthik on 4/4/16.
//  Copyright © 2016 KarthikThota. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase

var lmPath: String!
var dicPath: String!
var words: Array<String> = []
var currentWord: String!

var newNoteText: String!

var kLevelUpdatesPerSecond = 18

var kbHeight: CGFloat!

class AddNotesViewController: UIViewController, OEEventsObserverDelegate, UITextViewDelegate {

    let whiteColor = UIColor.whiteColor()
    var no:Int?
    
    
    
    var openEarsEventsObserver = OEEventsObserver()
    var startupFailedDueToLackOfPermissions = Bool()
    
    
    @IBOutlet weak var offlineSpeechSwitch: UISwitch!
    
    //    var openEarsEventsObserver = OEEventsObserver()
    //    var startupFailedDueToLackOfPermissions = Bool()
    
    @IBOutlet weak var heardTextView: UITextView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        heardTextView.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        
        heardTextView.delegate = self
        
 
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = whiteColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: whiteColor]
        
        
        
        
        loadOpenEars()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        heardTextView.layer.borderWidth = 0.5
        heardTextView.layer.borderColor = borderColor.CGColor
        heardTextView.layer.cornerRadius = 5.0
        
    }
    
    
    
    
    
    
    @IBAction func offlineSpeechPressed(sender: AnyObject) {
        
        if offlineSpeechSwitch.on {
            startListening()
        }
        else {
            stopListening()
        }
        
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
        
    }
    
    func pocketsphinxDidDetectSpeech() {
        print("Pocketsphinx has detected speech.")
        
    }
    
    func pocketsphinxDidDetectFinishedSpeech() {
        print("Pocketsphinx has detected a period of silence, concluding an utterance.")
        
    }
    
    func pocketsphinxDidStopListening() {
        print("Pocketsphinx has stopped listening.")
        
    }
    
    func pocketsphinxDidSuspendRecognition() {
        print("Pocketsphinx has suspended recognition.")
        
    }
    
    func pocketsphinxDidResumeRecognition() {
        print("Pocketsphinx has resumed recognition.")
        
    }
    
    func pocketsphinxDidChangeLanguageModelToFile(newLanguageModelPathAsString: String, newDictionaryPathAsString: String) {
        print("Pocketsphinx is now using the following language model: \(newLanguageModelPathAsString) and the following dictionary: \(newDictionaryPathAsString)")
    }
    
    func pocketSphinxContinuousSetupDidFailWithReason(reasonForFailure: String) {
        print("Listening setup wasn't successful and returned the failure reason: \(reasonForFailure)")
        
    }
    
    func pocketSphinxContinuousTeardownDidFailWithReason(reasonForFailure: String) {
        print("Listening teardown wasn't successful and returned the failure reason: \(reasonForFailure)")
        
    }
    
    func testRecognitionCompleted() {
        print("A test file that was submitted for recognition is now complete.")
        
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
        let str = "word ACL ACOEM ADE ADL AME AMEs AOE Abilify Aciphex Actiq Adderall Adelus Adson Advair Agilent Agrylin Aguilar Albuterol Alto Ambien Amitriptyline Androgel Anexia Ankylosing Antivert Arrhythmics Arthrotec Asthmacort Atenolol Ativan Avandamet Avandia Avenox Avinza Axert Azmacort Babinski Baclofen Belsky Benicar Bextra Biofreeze Bisacodyl Botox Botulinum BuSpar COE CPM CPT CRPS CSF CTDs CTS Celebrex Celexa Cerebellar Chitnis Clarinex Clinoril Clonazepam Compazine Concentra Concerta Contin Coumadin Cozaar Crestor Crohn's Cymbalta Cystometrograms DDD DPM DTR Danskin Darvocet Darvon Daypro Deafferentation Deboer Decadron Desyrel Detrol Devor DexAlone Dilaudid Diovan Disalcid Ditropan DonJoy Dosepak Duragesic Durgesic Dyazide Dynamometer Dynasplint EK EMG EMGs ESI Effexor Elavil Electroceutical Electrodiagnosis Electromyographer Epiphysitis Esgic Estrace FRP Feinberg Feldene Feldenkrais Fentanyl Fibromyalgia Finkelstein Finkelstein's Fioricet Fiorinal Flonase Frova GERD Gabapentin Gabitril Gastroesophageal Genzyme Glucophage HealthSouth HealthWorks Hyalgan Hydrocodone Hydrodiuril ICD IM IW Imitrex Intraspinal Ipratropium Jamar Kaiser Klonopin LESI Lamictal Lasix Levitra Levorphanol Levothyroid Levoxyl Lexapro Lidoderm Limbrel Lipitor Lodine Lofstrand Lorcet Lortab Lotensin Lotronex Luvox MDA MRI MRIs Marinol Maxalt MediCal Medrol Mendenhall Mexiletine Micronase Microvasive Midrin Migrazone MiraLax Mirapex Mobic Monopril Motrin Mumford Myobloc NCS NCV NSAIDS Nabumetone Namenda Naprosyn Natividad Neuromodulation Neurontin Norco Nortriptyline Norvasc ODG Olanzapine Oramorph Orthotripsy Oruvail OssaTron Oxcarbazepine OxyCodone OxyContin OxyIR Oxytrol Palladone Palletizer Palmomental Pamelor Parafon Parente Paxil Percocet Percodan Permanente Phalen's Phenergan Plaquenil Plaxo Pleasanton Polyneuropathies Prazosin Premarin Prempro Prevacid Prialt Prilosec Procardia Proscar Provigil Pseudoaddiction Psychostimulants QIW QME Quervain's RSD Radiopaque Raynaud's Reglan Relafen Relpax Remeron Robaxin SCIF SSEPT Safeway Senokot Seroquel Serzone Shigella Sinemet Sinequan Sjogren's Skelaxin Spurling's Strattera Suboxone Subutex Synthes Synthroid Synvisc TCFF TTD TTP Tagamet Talwin Tegretol Temazepam TempurPedic Tendonopathy Tenormin"
        
        words  = str.componentsSeparatedByString(" ")
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveNote" {
            newNoteText = ""
            newNoteText = "\(heardTextView.text)"
        }
    }
    
    

    
    // close keyboard on touch
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
