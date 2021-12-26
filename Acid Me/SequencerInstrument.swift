//
//  SequencerInstrument.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020  Pedro M. Moreno. All rights reserved.
//
//  Inspired by Patrick O'Leary's Building a MIDI Sequence in Swift tutorial
//  https://medium.com/@oleary.audio/building-a-midi-sequence-in-swift-bed5f5c2bb7d
//

import AudioKit

///
/// SequencerInstrument is the synthesizer's audio engine object. It compiles all the audio elements in the program:
///   * Oscillator.
///   * Effects.
///      - Distortion.
///      - Filter.
///      - Reverb.
///   * Output mixer.
///   * Sequencer.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
open class SequencerInstrument {
    
    /* VARIABLES */
    
    /* Oscillator */
    let oscillator: AKOscillatorBank
    var wave: AKTable!
    
    /* Distortion */
    var distortion: AKBitCrusher!
    var distDryWetMixer: AKDryWetMixer!
    
    /* Filter */
    var filter: AKRolandTB303Filter!
    
    /* Reverb */
    var reverb: AKZitaReverb!
    
    /* Mixer */
    var mixer:AKMixer!
    
    /* Sequencer */
    var midiNode: AKMIDINode!
    var track: AKSequencerTrack!
    let sequencer = AKSequencer()
    let sequenceLength = AKDuration(beats: 16.0)
    let midiHandler = AKMIDI()
    public static var currentDuration: Double!
    public static var currentLength: Double!
    
    
    /* Default constants */
    public static let stepSize: Double = 1/4
    public static let defaultKeyNotes = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71]
    public static let defaultOctave = 4
    let defaultDuration = 0.20
    let defaultLength: Double = 4.0
    public static let defaultVelocity = 120
    
    /* Handling */
    var currentKeyNotes: [Int]!
    public static var currentOctave = 4
    var currentRevDryWet: Double!
    var currentRevTime: Double!
    var currentBitDepth: Double!
    var currentDistDryWet: Double!
    
    /* Control Flags */
    var isSAW = true
    var isDistOn = false
    var isRevOn = false
    var isTrackStarted = false
    var isKeyboardOn = true
    
    /* ERRORS */
    let ERROR_1 = "ERROR: The button doesn't exist. Check tags in Main.storyboard.swif"
    let ERROR_2 = "ERROR: The button doesn't correspond to octave change. Check tags in Main.storyboard.swif"
    
    /* init */
    /// Inittialises AudioKit's engine, the synthesiser's oscillator, effects and sequencer.
    ///
    init(){
        oscillator = AKOscillatorBank()
        wave = AKTable.init()
        track = AKSequencerTrack()
        
        setDefaultKeyNotes()
        
        setupOsc()
        setUpDistortion()
        setUpFilter()
        setUpReverb()
        setUpMixer()
        
        setUpSequencer()
        
        AudioKit.output = mixer
        try! AudioKit.start()
    }
    
    /* SET-UP Functions */
    
    /* func setDefaultKeyNotes */
    /// Builds an array "currentKeyNotes with the default key notes in the keyboard.
    ///
    func setDefaultKeyNotes(){
        currentKeyNotes = SequencerInstrument.defaultKeyNotes
    }
    
    /* func setupOsc */
    /// Sets up the oscillator initial values.
    ///
    func setupOsc() {
        wave.sawtooth()
        oscillator.waveform = wave
        oscillator.attackDuration = 0.5
        oscillator.decayDuration = 0.1
        oscillator.sustainLevel = 0.0
        oscillator.releaseDuration = 0.0
    }
    
    /* func setUpDistortion */
    /// Intitialises the distortion effect and sets up its initial values.
    ///
    func setUpDistortion(){ // TODO: check bypass
        distortion = AKBitCrusher(oscillator)
        distortion.bitDepth = 0.5
        currentBitDepth = 5
        distDryWetMixer = AKDryWetMixer.init(dry: oscillator, wet: distortion, balance: 0.5)
        currentDistDryWet = 0.5
        distortion.stop()
        //  distortion.bypass()
    }
    
    /* func setUpFilter */
    /// Intitialises the filter effect and sets up its initial values.
    ///
    func setUpFilter(){
        filter = AKRolandTB303Filter(distDryWetMixer)
        filter.cutoffFrequency  = 1000.0
        filter.distortion = 0.0
        filter.resonance = 0.5
        filter.resonanceAsymmetry = 0
    }
    
    /* func setUpReverb */
    /// Intitialises the reverb effect and sets up its initial values.
    ///
    func setUpReverb() {
        reverb = AKZitaReverb(filter)
        currentRevTime = 1
        reverb.lowReleaseTime = currentRevTime
        reverb.midReleaseTime = currentRevTime
        currentRevDryWet = 0.5
        reverb.dryWetMix = 0.5
        reverb.bypass()
    }
    
    /* func setUpMixer */
    /// Intitialises the mixer and sets up its initial volume.
    ///
    func setUpMixer(){
        mixer = AKMixer(reverb)
        mixer.volume = 0.5
    }
    
    /* func setUpSequencer */
    /// Intitialises the sequencer and sets up its initial values.
    ///
    func setUpSequencer() {
        midiNode = AKMIDINode(node: oscillator)
        SequencerInstrument.currentDuration = defaultDuration
        track = sequencer.addTrack(for: midiNode)
        sequencer.length = defaultLength
        SequencerInstrument.currentLength = defaultLength
        midiNode.enableMIDI(midiHandler.client, name: "midiNode midi in")
        sequencer.tempo = 135
        sequencer.loopEnabled = true
    }
    
    /* CONTROL FLOW FUNCTIONS */
    
    /* func handlePressedButtons */
    /// Using the pressed button's tag (the one that is calling the function), it calls the different functions to be triggered.
    /// - Parameter button: UIButton object that is calling this function (when pressed).
    ///
    func handlePressedButtons(button: UIButton){
        switch button.tag {
        case 0...11:
            playNote(noteOrder: button.tag)
        case 12:
            keyOnOff()
        case 14:
            playStopSequence()
        case 17:
            setWaveForm()
        case 18:
            distortionOnOff()
        case 19:
            reverbOnOff()
        case 20:
            clearGrid()
        case 21, 22:
            changeOctave(button: button)
        default:
            print(ERROR_1)
        }
    }
    
    /* KEYBOARD FUNCTIONS */
    
    /* func playNote */
    /// Plays the note when its button is pressed.
    /// - Parameter noteOrder: order used to look for the currentKeyNotes array, containing the associated note to the button.
    ///
    func playNote(noteOrder: Int){
        let velocity = 127
        let note = currentKeyNotes[noteOrder]
        oscillator.play(noteNumber: MIDINoteNumber(note), velocity: MIDIVelocity(velocity))
    }
    
    /* func handleReleasedButtons */
    /// Stops the note when its button is released.
    /// - Parameter button: UIButton object that is calling this function (when released).
    ///
    func handleReleasedButtons(button: UIButton){
        if button.tag >= 0 && button.tag <= 11 {
            stopNote(noteOrder: button.tag)
        }
    }
    
    /* func stopNote */
    /// Stops the note when its button is released.
    /// - Parameter noteOrder: order used to look for the currentKeyNotes array, containing the associated note to the button.
    ///
    func stopNote(noteOrder: Int){
        let note = currentKeyNotes[noteOrder]
        oscillator.stop(noteNumber: MIDINoteNumber(note))
    }
    
    /* func changeOctave */
    /// Handles the octave buttons and calls the corresponding functions.
    /// - Parameter button: UIButton object used for lowering or increasing the octave.
    ///
    func changeOctave(button: UIButton){
        switch button.tag {
        case 21:
            octaveDown()
        case 22:
            octaveUp()
        default:
            print(ERROR_2)
        }
    }
    
    /* func octaveDown */
    /// Lowers  keyboard's notes and grid's notes by 1 octave (12 semitones)
    /// - Parameter button: UIButton object used for lowering the octave.
    ///
    func octaveDown(){
        SequencerInstrument.currentOctave -= 1
        
        for i in 0..<currentKeyNotes.count {
            currentKeyNotes[i] -= 12
        }
        
        updateGridOctave(octaveUp: false)
    }
    
    /* func octaveUp */
    /// Increases  keyboard's notes and grid's notes by 1 octave (12 semitones)
    /// - Parameter button: UIButton object used for increasing the octave.
    ///
    func octaveUp(){
        SequencerInstrument.currentOctave += 1
        
        for i in 0..<currentKeyNotes.count {
            currentKeyNotes[i] += 12
        }
        
        updateGridOctave(octaveUp: true)
    }
    
    /* func keyOnOff */
    /// Controls the keyboard button state by using the Bool flag isKeyboardOn
    ///   * Allows to change between the grid view and the keyboard view.
    ///
    func keyOnOff(){
        if isKeyboardOn {
            isKeyboardOn = false
        } else {
            isKeyboardOn = true
        }
    }
    
    /* SEQUENCER FUNCTIONS */
    
    /* func clearGrid */
    /// Clears the grid by removing the notes from the sequence and by changing the cells images.
    ///
    func clearGrid(){
        for i in  GridViewController.gridButtons{
            i.button.setImage(UIImage(named: "ACID ME!_cellTransparent.png"), for: .normal)
            i.isPressed = false
        }
        sequencer.clear()
    }
    
    /* func getSequence */
    /// Takes the gridButtons array which contains all the CellObjects and returns an array containing the notes that are pressed.
    /// - Returns: notes: array  containing the notes that are pressed.
    ///
    func getSequence() -> [CellObject]{
        var notes: [CellObject] = []
        for i in  GridViewController.gridButtons{
            if i.isPressed {
                notes.append(i)
            }
        }
        return notes
    }
    
    /* func buildSequence */
    /// Adds the notes received in the parameter to the the sequencer's track to be played.
    /// - Parameter notes: array  containing the notes that are pressed.
    ///
    func buildSequence(notes: [CellObject]){
        if !notes.isEmpty {
            sequencer.tracks[0].clear()
            for i in notes {
                sequencer.tracks[0].add(noteNumber: MIDINoteNumber(i.coordinates.note), velocity: MIDIVelocity(SequencerInstrument.defaultVelocity), position: (i.coordinates.position * SequencerInstrument.stepSize),  duration: SequencerInstrument.currentDuration)
            }
        }
    }
    
    /* func updateGridOctave */
    /// Increases or lowers the grid's notes by 1 octave (12 semitones).
    ///
    /// - Parameter octaveUp: Bool flag indicating if the octave is increased or lowered.
    func updateGridOctave(octaveUp: Bool){
        
        if octaveUp {
            for i in  GridViewController.gridButtons{
                i.coordinates.note += 12
            }
        } else {
            for i in  GridViewController.gridButtons{
                i.coordinates.note -= 12
            }
        }
        updateGridOctaveWhilePlaying()
    }
    
    
    /* func updateGridOctaveWhilePlaying */
    /// Takes any change performed in the grid while the sequence is playing.
    ///
    func updateGridOctaveWhilePlaying(){
        var positionCounter = -1.0
        for i in GridViewController.gridButtons {
            if i.coordinates.position != positionCounter {
                sequencer.tracks[0].removeNote(at: Double(i.coordinates.position * SequencerInstrument.stepSize))
                for j in getNotesAtPositon(position: i.coordinates.position) {
                    sequencer.tracks[0].add(noteNumber: MIDINoteNumber(j.coordinates.note), velocity: MIDIVelocity(SequencerInstrument.defaultVelocity), position: (j.coordinates.position * SequencerInstrument.stepSize),  duration: SequencerInstrument.currentDuration)
                }
                positionCounter = i.coordinates.position
            }
        }
    }
    
    /* func  getNotesAtPositon */
    /// Returns an array containing the notes pressed in the time-position received as parameter.
    /// - Parameter position: value that indicates the time-position  in the grid.
    /// - Returns: notesAtPosition: array containing all the cells pressed in the specified position.
    ///
    func getNotesAtPositon(position: Double) -> [CellObject] {
        var notesAtPosition: [CellObject] = []
        for i in GridViewController.gridButtons {
            if i.coordinates.position == position && i.isPressed{
                notesAtPosition.append(i)
            }
        }
        return notesAtPosition
    }
    
    /* func playStopSequence */
    /// Stops/Plays the sequencer.
    ///
    func playStopSequence(){
        if sequencer.isPlaying {
            sequencer.tracks[0].rampDuration = 0.0
            sequencer.tracks[0].stopPlayingNotes()
            sequencer.stop()
            GridViewController.stepModel.stopTimer()
        } else {
            buildSequence(notes: getSequence())
            sequencer.playFromStart()
            GridViewController.stepModel.startTimer()
        }
        
    }
    
    /* SYNTH'S PARAMETERS FUNCTIONS */
    
    /* func setTone */
    /// Changes oscillator's tone.
    ///  * Default: A4 = 440 Hz.
    ///  * Range: +/- 12 st.
    /// - Parameter tone: new tone value.
    ///
    func setTone(tone: Double){
        oscillator.pitchBend = tone
    }
    
    /* func setCutOff */
    /// Changes filter's cutoff frequency.
    ///  * Range: 500 Hz - 10 KHz.
    ///  * Default: 1 KHz..
    /// - Parameter frequency: new cutoff frequency value.
    ///
    func setCutOff(frequency: Double){
        let realFrequency = pow(10, frequency) // Turns linear input to logarithmic scale.
        filter.cutoffFrequency = realFrequency
    }
    
    /* func setResonance */
    /// Changes filter's resonance.
    ///  * Range: 0 - 1.5.
    ///  * Default: 0.5.
    /// - Parameter resonance: new resonance value.
    ///
    func setResonance(resonance: Double){
        filter.resonance = resonance
    }
    
    /* func setAccent */
    /// Changes oscillator's attack.
    ///  * Range: 0 - 1.
    ///  * Default: 0.5.
    /// - Parameter accent: new accent value in seconds.
    ///
    func setAccent(accent: Double){
        oscillator.attackDuration = accentToAttack(accent: accent)
    }
    
    /* func accentToAttack */
    /// Turns attack into accent (inverse characteristic). The lower the attack, the higher the accent; and vice versa.
    /// - Parameter accent: new accent value in seconds.
    ///
    func accentToAttack(accent: Double)-> Double{
        return 1 - accent
    }
    
    /* func setDecay */
    /// Changes oscillator's decay time.
    ///  * Range: 0 - 1.
    ///  * Default: 0.1.
    /// - Parameter decay: new decay time value in seconds.
    ///
    func setDecay(decay: Double){
        oscillator.decayDuration = decay
    }
    
    /* func Release */
    /// Changes oscillator's release time.
    ///  * Range: 0 - 1.
    ///  * Default: 0.
    /// - Parameter release: new release time value in seconds.
    ///
    func setRelease(release: Double){
        oscillator.releaseDuration = release
    }
    
    /* func setVolume */
    /// Changes mixer's volume.
    ///  * Range: 0 - 1.
    ///  * Default: 0.
    /// - Parameter volume: new volume value.
    ///
    func setVolume(volume: Double){
        mixer.volume = volume
    }
    
    /* func setTempo */
    /// Changes sequencer's tempo.
    ///  * Range: 100 - 160 bpm.
    ///  * Default: 135 bpm.
    /// - Parameter bpm: new tempo value.
    ///
    func setTempo(bpm: Double){
        sequencer.tempo = bpm
    }
    
    /* func setWaveForm */
    /// Changes oscillator's waveform from Sawtooth to Square, and vice versa.
    ///
    func setWaveForm(){
        if  isSAW {
            wave.square()
            oscillator.waveform = wave
            isSAW = false
        } else {
            wave.sawtooth()
            oscillator.waveform = wave
            isSAW = true
        }
    }
    
    /* EFFECTS' FUNCTIONS */
    
    /* func setBitDepth */
    /// Changes distorion's bit depth.
    ///  * Range: 1 - 24.
    ///  * Default: 5.
    /// - Parameter bitDepth: new bit depth value.
    ///
    func setBitDepth(bitDepth: Double){
        currentBitDepth = bitDepth
        if !isDistOn { // Allows the change without turning on the effect.
            distortion.bitDepth = currentBitDepth
        }
    }
    
    /* func distortionDryWet */
    /// Changes distorion's dry/wet balance.
    ///  * Range: 0 - 1.
    ///  * Default: 0.5.
    /// - Parameter dryWet: new dry/wet value.
    ///
    func distortionDryWet(dryWet: Double){
        currentDistDryWet = dryWet
        if isDistOn { // Allows the change without turning on the effect.
            distDryWetMixer.balance = currentDistDryWet
        }
    }
    
    /* func distortionOnOff */
    /// Turns the distortion on/off.
    ///  * Default: off.
    ///
    func distortionOnOff(){
        if isDistOn {
            distortion.stop()
            isDistOn = false
        } else {
            distortion.bitDepth = currentBitDepth
            distDryWetMixer.balance  = currentDistDryWet
            distortion.start()
            isDistOn = true
        }
    }
    
    /* func setReverbTime */
    /// Adjusts the Reverb's  decay time
    ///  * Range: 0.001 - 20.
    ///  * Default: 1.
    /// - Parameter time: new decay time value.
    ///
    func setReverbTime(time: Double){
        currentRevTime = time
        if isRevOn { // Allows the change without turning on the effect.
            reverb.lowReleaseTime = currentRevTime
            reverb.midReleaseTime = currentRevTime
        }
    }
    
    /* func reverbDryWet */
    /// Adjusts the Reverb's Dry / Wet mix
    ///  * Range: 0 - 1.
    ///  * Default: 0.5.
    /// - Parameter dryWet: new dry/wet value.
    func reverbDryWet(dryWet: Double){
        currentRevDryWet = dryWet
        if isRevOn { // Allows the change without turning on the effect.
            reverb.dryWetMix = dryWet
        }
    }
    
    /* func reverbOnOff */
    /// Turns the reverb on/off.
    ///  * Default: off.
    ///
    func reverbOnOff(){
        if isRevOn {
            reverb.bypass()
            isRevOn = false
        } else {
            reverb.dryWetMix = currentRevDryWet
            reverb.lowReleaseTime = currentRevTime
            reverb.midReleaseTime = currentRevTime
            reverb.start()
            isRevOn = true
        }
    }
}
