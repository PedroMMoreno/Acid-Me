//
//  ViewController.swift
//  Acid Me!
//
//  Created by Pedro M.Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M. Moreno. All rights reserved.
//

import UIKit
//Test coment
///
/// ViewController handles the user interaction with the main view.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
class ViewController: UIViewController {
    
    /* VARIABLES */
    
    /* CONTROL FLOW */
    public static var firstLoad = true
    public static var executionDiff: CFAbsoluteTime!
    
    /* KEYBOARD */
    
    var buttons: [Int: ButtonPackage] = [:]
    
    @IBOutlet weak var keyboardView: UIView!
    
    @IBOutlet weak var keyCPressed: UIImageView!
    @IBOutlet weak var keyCSPressed: UIImageView!
    @IBOutlet weak var keyDPressed: UIImageView!
    @IBOutlet weak var keyDSPressed: UIImageView!
    @IBOutlet weak var keyEPressed: UIImageView!
    @IBOutlet weak var keyFPressed: UIImageView!
    @IBOutlet weak var keyFSPressed: UIImageView!
    @IBOutlet weak var keyGPressed: UIImageView!
    @IBOutlet weak var keyGSPressed: UIImageView!
    @IBOutlet weak var keyAPressed: UIImageView!
    @IBOutlet weak var keyASPressed: UIImageView!
    @IBOutlet weak var keyBPressed: UIImageView!
    
    
    /* BUTTONS */
    @IBOutlet weak var keyBoardPressed: UIImageView!
    @IBOutlet weak var clearGridPressed: UIImageView!
    @IBOutlet weak var startStorpPressed: UIImageView!
    @IBOutlet weak var octDownPressed: UIImageView!
    @IBOutlet weak var octUpPressed: UIImageView!
    @IBOutlet weak var waveformSQ: UIImageView!
    @IBOutlet weak var waveformSAW: UIImageView!
    
    // EFFECTS
    @IBOutlet weak var distortionON: UIImageView!
    @IBOutlet weak var distortionOFF: UIImageView!
    @IBOutlet weak var reverbON: UIImageView!
    @IBOutlet weak var reverbOFF: UIImageView!
    
    /* KNOBS */
    @IBOutlet weak var tuneKnob: ImageKnob!
    @IBOutlet weak var cutoffKnob: ImageKnob!
    @IBOutlet weak var resonanceKnob: ImageKnob!
    @IBOutlet weak var accentKnob: ImageKnob!
    @IBOutlet weak var releaseKnob: ImageKnob!
    @IBOutlet weak var decayKnob: ImageKnob!
    @IBOutlet weak var volumeKnob: ImageKnob!
    @IBOutlet weak var tempoKnob: ImageKnob!
    @IBOutlet weak var decimationKnob: ImageKnob!
    @IBOutlet weak var distDryWetKnob: ImageKnob!
    @IBOutlet weak var reverbTimeKnob: ImageKnob!
    @IBOutlet weak var reverbDryWetKnob: ImageKnob!
    
    /* LEDS */
    @IBOutlet weak var cLed: UIImageView!
    @IBOutlet weak var cSLed: UIImageView!
    @IBOutlet weak var dLed: UIImageView!
    @IBOutlet weak var dSLed: UIImageView!
    @IBOutlet weak var eLed: UIImageView!
    @IBOutlet weak var fLed: UIImageView!
    @IBOutlet weak var fSLed: UIImageView!
    @IBOutlet weak var gLed: UIImageView!
    @IBOutlet weak var gSLed: UIImageView!
    @IBOutlet weak var aLed: UIImageView!
    @IBOutlet weak var aSLed: UIImageView!
    @IBOutlet weak var bLed: UIImageView!
    
    @IBOutlet weak var keyboardLed: UIImageView!
    @IBOutlet weak var startStopLed: UIImageView!
    
    /* LABELS */
    
    @IBOutlet weak var octaveLabel: UILabel!
    
    /* GRID */
    @IBOutlet weak var gridView: UIView!

    /* INSTRUMENT */
    public static var sequencer: SequencerInstrument!
    
    /* ERRORS */
    let ERROR_1 = "ERROR: The button doesn't exist. Check tags in Main.storyboard.swif"
    
    /* func viewDidLoad */
    /// Sets up the Main view and its initial elements.
    ///
    override func viewDidLoad() {
        let start = CFAbsoluteTimeGetCurrent() // Used to measure the execution time
        super.viewDidLoad()
        setupCallbacks() // Set up knobs
        
        keyboardView.isHidden = false
        gridView.isHidden = true
        initButtons() // Set up buttons
        
        if  ViewController.firstLoad { // Allows to load the main view just once.
            ViewController.sequencer  = SequencerInstrument()
            ViewController.firstLoad = false
        }
        
        let diff = CFAbsoluteTimeGetCurrent() - start // Execution time
        print("Loading Main View took \(diff) seconds.")
        
        if GridViewController.executionStart != nil {
            ViewController.executionDiff = CFAbsoluteTimeGetCurrent() - GridViewController.executionStart
            print("Loading ACID ME!  took \(ViewController.executionDiff!) seconds.")
        }
    }
    
    /* func prefersStatusBarHidden */
    /// Hides the status bar.
    ///
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /* func prefersHomeIndicatorAutoHidden */
    /// Hides the home indicator.
    ///
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    /* func initButtons */
    /// Initializes Main window's buttons.
    /// *  Note: Cases 13, 15 & 16 correspond to functionalities that have been removed for this version and might be developed in the future:
    ///     - 13: Arpeggiator.
    ///     - 15: Mono.
    ///     - 16: Hold.
    ///
    func initButtons(){
        var image: UIImageView!
        var led: UIImageView!
        var hasLed: Bool = true
        var hasMainImage: Bool = false
        var mainImage: UIImageView! = waveformSAW
        
        for i in 0...22 {
            switch i {
            //KEYS Press & release + led
            case 0:
                image = keyCPressed
                led = cLed
            case 1:
                image = keyCSPressed
                led = cSLed
            case 2:
                image = keyDPressed
                led = dLed
            case 3:
                image = keyDSPressed
                led = dSLed
            case 4:
                image = keyEPressed
                led = eLed
            case 5:
                image = keyFPressed
                led = fLed
            case 6:
                image = keyFSPressed
                led = fSLed
            case 7:
                image = keyGPressed
                led = gLed
            case 8:
                image = keyGSPressed
                led = gSLed
            case 9:
                image = keyAPressed
                led = aLed
            case 10:
                image = keyASPressed
                led = aSLed
            case 11:
                image = keyBPressed
                led = bLed
            //BUTTONS Hold + led
            case 12:
                image = keyBoardPressed
                led = keyboardLed
            case 14:
                image = startStorpPressed
                led = startStopLed
            //FX Hold & no led
            case 17:
                image = waveformSQ
                hasLed = false
                hasMainImage = true
                mainImage = waveformSAW
            case 18:
                image = distortionON
                hasLed = false
                hasMainImage = true
                mainImage = distortionOFF
            case 19:
                image = reverbON
                hasLed = false
                hasMainImage = true
                mainImage = reverbOFF
                
            //BUTTONS Press & release & no led
            case 20:
                image = clearGridPressed
                hasLed = false
            case 21:
                image = octDownPressed
                hasLed = false
            case 22:
                image = octUpPressed
                hasLed = false
            default:
                print(ERROR_1)
            }
            buttons[i] = ButtonPackage(order: i, image: image,hasLed: hasLed, isPressed: false, ledImage: led, hasMainImage: hasMainImage, mainImage: mainImage)
        }
    }
    
    
    /* func buttonPressed */
    /// Handles the events that the buttons trigger when they are pressed and calls the function handlePressedButtons, where the audio functionalities take place.
    /// - Parameter sender: the UIButton that has been pressed.
    ///
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tag = sender.tag
        let button = buttons[tag]!
        
        if tag >= 12 && tag <= 19  {
            if  tag >= 17 {
                checkPressed(button: button, sender: sender, onOff:  true)
            }else {
                sender.imageView?.isHidden = true
                button.secondImage.isHidden = false
                checkPressed(button: button, sender: sender, onOff:  false)
                
                if tag == 12 && !button.isPressed{
                    keyboardView.isHidden = false
                    gridView.isHidden = true
                } else if tag == 12 && button.isPressed {
                    keyboardView.isHidden = true
                    gridView.isHidden = false
                }
            }
        } else {
            sender.imageView?.isHidden = true
            button.secondImage.isHidden = false
            button.isPressed = true
            button.turnLedOn(on: true)
            sender.imageView?.isHidden = true
        }
        
        ViewController.sequencer.handlePressedButtons(button: sender)
        
        if sender.tag == 21 || sender.tag == 22 {
            updateOctLabel()
        }
    }
    
    /* func checkPressed */
    /// Checks if a specific button is pressed and turns on/off the main/second image or the led associated with that button.
    /// - Parameter button: ButtonPackage object containing the main and second image of the button.
    /// - Parameter sender: UIButton object that triggers the functon.
    /// - Parameter onOff: flag to control the led's on/off status.
    ///
    func checkPressed(button: ButtonPackage, sender: UIButton, onOff: Bool) {
        if button.isPressed {
            button.isPressed = false
            button.turnLedOn(on: false)
            
            if onOff {
                button.mainImage.isHidden = false
                button.secondImage.isHidden = true
            }
        } else {
            button.isPressed = true
            button.turnLedOn(on: true)
            if onOff {
                button.mainImage.isHidden = true
                button.secondImage.isHidden = false
            }
        }
    }
    
    /* func buttonReleased */
    /// Handles the events that the buttons trigger when they are pressed and calls the function handleReleasedButtons, where the audio functionalities take place.
    /// - Parameter sender: the UIButton that has been released.
    ///
    @IBAction func buttonReleased(_ sender: UIButton) {
        let tag = sender.tag
        let button = buttons[tag]!
        
        if tag < 12 || tag > 19 { // Press & Release (no led)
            button.secondImage.isHidden = true
            button.isPressed = false
            button.turnLedOn(on: false)
            sender.imageView?.isHidden = false
        }
        ViewController.sequencer.handleReleasedButtons(button: sender)
    }
    
    
    
    /* func updateOctLabel */
    /// Updates the octave label when the octave is changed.
    ///
    func updateOctLabel(){
        octaveLabel.text = String(SequencerInstrument.currentOctave)
    }
    
    /* func setupCallbacks */
    /// Initialises and handles the knobs values and changes.
    ///
    func setupCallbacks() {
        tuneKnob.callback = { value in
            ViewController.sequencer.setTone(tone: Double(value))
        }
        
        cutoffKnob.callback = { value in
            ViewController.sequencer.setCutOff(frequency: Double(value))
        }
        
        resonanceKnob.callback = { value in
            ViewController.sequencer.setResonance(resonance: Double(value))
        }
        
        accentKnob.callback = { value in
            ViewController.sequencer.setAccent(accent: Double(value))
        }
        
        decayKnob.callback = { value in
            ViewController.sequencer.setDecay(decay: Double(value))
            
        }
        
        releaseKnob.callback = { value in
            ViewController.sequencer.setRelease(release: Double(value))
        }
        
        volumeKnob.callback = { value in
            ViewController.sequencer.setVolume(volume: Double(value))
        }
        
        tempoKnob.callback = { value in
            ViewController.sequencer.setTempo(bpm: Double(value))
            GridViewController.stepModel.updateSpeed(bpm: Double(value))
        }
        
        decimationKnob.callback = { value in
            ViewController.sequencer.setBitDepth(bitDepth: Double(value))
        }
        
        distDryWetKnob.callback = { value in
            ViewController.sequencer.distortionDryWet(dryWet: Double(value))
        }
        
        reverbTimeKnob.callback = { value in
            ViewController.sequencer.setReverbTime(time: Double(value))
        }
        
        reverbDryWetKnob.callback = { value in
            ViewController.sequencer.reverbDryWet(dryWet: Double(value))
        }
    }
    

}
