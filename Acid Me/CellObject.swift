//
//  ViewController.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import UIKit

///
/// CellObject compiles all the useful information of a specific cell in the grid,  in order to handle its state changes.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
open class CellObject  {
    
    /* VARIABLES */
    var button: UIButton!
    var isPressed: Bool
    var coordinates: (position: Double,note: Int)!
    var isWhite: Bool = true
    
    /* CONSTANTS */
    let ERROR_1 = "ERROR: Couldn't find that cell."
    
    /* init */
    /// Inittialises a cell's associated CellObject object and its properties.
    /// - Parameter button: UIButton object that corresponds to the cell.
    ///
    init(button: UIButton){
        button.imageView?.isHidden = true
        self.button = button
        self.isPressed = false
        self.coordinates = getCellCoordinates(cell: button)
    }
    
    /* func getCellCoordinates */
    /// Handles the position of the button by using its tag.
    /// - Parameter cell: UIButton object that corresponds to the cell.
    /// - Returns: a tuple containing the values of the cell's coordinates (note and time-position).
    ///
    func getCellCoordinates(cell: UIButton) -> (Double,Int){
        var coordinates = (position: -1.0, note: -1)
        var positionOffSet = 0
        var note = SequencerInstrument.defaultKeyNotes[0]
        
        switch cell.tag {
        case 0...15: // C notes
            positionOffSet = 0
            note = SequencerInstrument.defaultKeyNotes[0]
        case 16...31: // C# notes
            positionOffSet = 16
            note = SequencerInstrument.defaultKeyNotes[1]
            isWhite = false
        case 32...47: // D notes
            positionOffSet = 32
            note = SequencerInstrument.defaultKeyNotes[2]
        case 48...63: // D# notes
            positionOffSet = 48
            note = SequencerInstrument.defaultKeyNotes[3]
            isWhite = false
        case 64...79: // E notes
            positionOffSet = 64
            note = SequencerInstrument.defaultKeyNotes[4]
        case 80...95: //F notes
            positionOffSet = 80
            note = SequencerInstrument.defaultKeyNotes[5]
        case 96...111: // F# notes
            positionOffSet = 96
            note = SequencerInstrument.defaultKeyNotes[6]
            isWhite = false
        case 112...127: // G notes
            positionOffSet = 112
            note = SequencerInstrument.defaultKeyNotes[7]
        case 128...143: // G# notes
            positionOffSet = 128
            note = SequencerInstrument.defaultKeyNotes[8]
            isWhite = false
        case 144...159: // A notes
            positionOffSet = 144
            note = SequencerInstrument.defaultKeyNotes[9]
        case 160...175: // A# notes
            positionOffSet = 160
            note = SequencerInstrument.defaultKeyNotes[10]
            isWhite = false
        case 176...191: // B notes
            positionOffSet = 176
            note = SequencerInstrument.defaultKeyNotes[11]
        default:
            print(ERROR_1)
        }
        coordinates = ((position: getPosition(offSet: positionOffSet, tag: cell.tag), note: note))
        return coordinates
    }
    
    /* func getPosition */
    /// Handles the position of the button by using its tag.
    /// - Parameter offSet: variable to handle the absolute time-position of the cell.
    /// - Parameter tag: variable that indicates the relative time-position of the cell.
    /// - Returns: a tuple containing the values of the cell's coordinates (note and time-position).
    ///
    func getPosition(offSet: Int, tag: Int) -> Double {
        return Double(tag - offSet)
    }
}
