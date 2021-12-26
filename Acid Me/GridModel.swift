//
//  GridObject.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import AudioKit

///
/// GridModel handles the events triggered from the GridView when the cells are activated or deactivated.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
open class GridModel{
    
    /* func updateCellStatus */
    /// Updates the cell status when pressed. The cell will be either removed or added to the sequence.
    /// - Parameter cell: the cell to be added / removed.
    ///
    func updateCellStatus(cell: CellObject){
        if ViewController.sequencer.sequencer.isPlaying {
            if !cell.isPressed {
                addCellWhilePlaying(cell: cell)
                cell.isPressed = true
            } else {
                removeCellWhilePlaying(cell: cell)
                cell.isPressed = false
            }
        } else {
            if !cell.isPressed {
                cell.isPressed = true
            } else {
                cell.isPressed = false
            }
        }
    }
    
    /* func addCellWhilePlaying */
    /// Adds the pressed cell (parameter) to the sequence when the sequencer is playing.
    /// - Parameter cell: cell to be added.
    ///
    func addCellWhilePlaying(cell: CellObject){
        cell.coordinates.note = cell.coordinates.note
        let sequencer = ViewController.sequencer.sequencer
        sequencer.tracks[0].add(noteNumber: MIDINoteNumber(cell.coordinates.note), velocity: MIDIVelocity(SequencerInstrument.defaultVelocity), position: (cell.coordinates.position * SequencerInstrument.stepSize), duration: SequencerInstrument.currentDuration)
    }
    
    /* func removeCellWhilePlaying */
    /// Removes the pressed cell (parameter) to the sequence when the sequencer is playing.
    /// - Parameter cell: cell to be removed.
    ///
    func removeCellWhilePlaying(cell: CellObject){
        let notesAtPosition = elementsAtPosition(position: cell.coordinates.position)
        let sequencer = ViewController.sequencer.sequencer
        
        sequencer.tracks[0].removeNote(at: Double(cell.coordinates.position * SequencerInstrument.stepSize))
        if notesAtPosition.isNotEmpty {
            for i in notesAtPosition {
                if i.coordinates.position == cell.coordinates.position && i.coordinates.note != cell.coordinates.note{
                    sequencer.tracks[0].add(noteNumber: MIDINoteNumber(i.coordinates.note), velocity: MIDIVelocity(SequencerInstrument.defaultVelocity), position: (i.coordinates.position * SequencerInstrument.stepSize),  duration: SequencerInstrument.currentDuration)            }
            }
        }
    }
    
    /* func elementsAtPosition */
    /// Taking the time-position, it returns all the cells pressed at that time-position.
    /// - Parameter position: time-position coordinate.
    /// - Returns: notesAtPosition: an array with all the CellObjects corresponding to the active cells in the specified position.
    ///
    public func elementsAtPosition(position: Double) -> [CellObject]{
        var notesAtPosition: [CellObject] = []
        
        for i in  GridViewController.gridButtons {
            if i.coordinates.position == position && i.isPressed {
                notesAtPosition.append(i)
            }
        }
        return notesAtPosition
    }
    
    /* func getCell */
    /// Searches the CellObject stored in the specified order in the GridViewController.gridButtons array.
    /// - Parameter order: order in the gridButtons array.
    /// - Returns:CellObject in that order in the array.
    func getCell(order: Int) -> CellObject {
        return GridViewController.gridButtons[order]
    }
}
