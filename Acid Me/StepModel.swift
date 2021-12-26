//
//  StepModel.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import UIKit
import  AudioKit

///
/// StepModel handles the step indicator in the Grid View
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
open class StepModel {
    
    /* VARIABLES */
    public static var stepArray: [UIButton] = []
    public static var stepCount = 0
    public static var timer: Timer!
    
    /* init */
    /// Inittialises the timer and the step positions.
    ///
    init(){
        resetSteps()
    }
    
    /* func sequenceSteps */
    /// Starts the timer and the step indicator movement.
    ///
    func sequenceSteps(){
        if !StepModel.stepArray.isEmpty {
            startTimer()
        }
    }
    
    /* func startTimer */
    /// Starts the timer and the step indicator movement.
    ///
    func startTimer(){
        if ViewController.sequencer != nil {
            let tempo = ViewController.sequencer.sequencer.tempo
            let speed = (60 / tempo) / 4
            
            StepModel.timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector:  #selector(runSteps), userInfo: nil, repeats: true)
        }
    }
    
    /* func runSteps */
    /// Handles the step indicator movement by changing the backgound colour of the buttons stored in the  StepModel.stepArray array.
    ///
    @objc func runSteps(){
        stepOn(step: StepModel.stepArray[StepModel.stepCount])
        if   StepModel.stepCount > 0 {
            stepOff(step: StepModel.stepArray[StepModel.stepCount-1])
        } else {
            stepOff(step: StepModel.stepArray[15])
            
        }
        
        StepModel.stepCount += 1
        
        if StepModel.stepCount == 16 {
            StepModel.stepCount = 0
        }
    }
    
    /* func stepOn */
    /// Switches on a step position on by setting the background colour of the button to yellow.
    /// - Parameter step: button corresponding to the position being switched on.
    ///
    func stepOn(step: UIButton){
        step.backgroundColor = UIColor.yellow
    }
    
    /* func stepOff */
    /// Switches off a step position on by setting the background colour of the button to black.
    /// - Parameter step: button corresponding to the position being switched off.
    ///
    func stepOff(step: UIButton){
        step.backgroundColor = UIColor.black
    }
    
    /* func stopTimer */
    /// Stops the timer and resets the step indicator position.
    ///
    func stopTimer(){
        if StepModel.timer != nil {
            StepModel.timer?.invalidate()
            StepModel.timer = nil
            resetSteps()
        }
    }
    
    /* func resetSteps */
    /// Resets the step indicator position.
    ///
    func resetSteps(){
        if !StepModel.stepArray.isEmpty {
            for i in StepModel.stepArray {
                stepOff(step: i)
            }
            stepOn(step: StepModel.stepArray[0])
            StepModel.stepCount = 0
        }
    }
    
    
    /* func updateSpeed */
    /// Updates the timer speed by invalidating the previous one (with the previous speed) and creating a new one, taking the new bpm as reference.
    ///
    func updateSpeed(bpm: Double){
        if ViewController.sequencer != nil && ViewController.sequencer.sequencer.isPlaying {
            let timeInterval = (60 / bpm) / 4
            StepModel.timer?.invalidate()
            StepModel.timer = nil
            StepModel.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector:  #selector(runSteps), userInfo: nil, repeats: true)
        }
    }
}
