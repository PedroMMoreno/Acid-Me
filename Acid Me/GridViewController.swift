//
//  GridViewController.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import UIKit
import AudioKit

///
/// GridViewController handles the user interaction with the grid view.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
class GridViewController: UIViewController {
    
    /* VARIABLES */
    
    public static var executionStart: CFAbsoluteTime!
    public static var gridButtons = [CellObject]()
    var gridModel: GridModel!
    public static var stepModel: StepModel!

    /* Cells' buttons */
    
    // C
    @IBOutlet weak var gridC_1: UIButton!
    @IBOutlet weak var gridC_1_2: UIButton!
    @IBOutlet weak var gridC_1_3: UIButton!
    @IBOutlet weak var gridC_1_4: UIButton!
    @IBOutlet weak var gridC_2: UIButton!
    @IBOutlet weak var gridC_2_2: UIButton!
    @IBOutlet weak var gridC_2_3: UIButton!
    @IBOutlet weak var gridC_2_4: UIButton!
    @IBOutlet weak var gridC_3: UIButton!
    @IBOutlet weak var gridC_3_2: UIButton!
    @IBOutlet weak var gridC_3_3: UIButton!
    @IBOutlet weak var gridC_3_4: UIButton!
    @IBOutlet weak var gridC_4: UIButton!
    @IBOutlet weak var gridC_4_2: UIButton!
    @IBOutlet weak var gridC_4_3: UIButton!
    @IBOutlet weak var gridC_4_4: UIButton!
    
    /* func initCRow */
    /// Initialises the note C cells.
    ///
    func initCRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridC_1
            case 1:
                button = gridC_1_2
            case 2:
                button = gridC_1_3
            case 3:
                button = gridC_1_4
            case 4:
                button = gridC_2
            case 5:
                button = gridC_2_2
            case 6:
                button = gridC_2_3
            case 7:
                button = gridC_2_4
            case 8:
                button = gridC_3
            case 9:
                button = gridC_3_2
            case 10:
                button = gridC_3_3
            case 11:
                button = gridC_3_4
            case 12:
                button = gridC_4
            case 13:
                button = gridC_4_2
            case 14:
                button = gridC_4_3
            case 15:
                button = gridC_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
            //gridButtons[button.tag]! = gridCell
        }
    }
    
    // C#
    @IBOutlet weak var gridCS_1: UIButton!
    @IBOutlet weak var gridCS_1_2: UIButton!
    @IBOutlet weak var gridCS_1_3: UIButton!
    @IBOutlet weak var gridCS_1_4: UIButton!
    @IBOutlet weak var gridCS_2: UIButton!
    @IBOutlet weak var gridCS_2_2: UIButton!
    @IBOutlet weak var gridCS_2_3: UIButton!
    @IBOutlet weak var gridCS_2_4: UIButton!
    @IBOutlet weak var gridCS_3: UIButton!
    @IBOutlet weak var gridCS_3_2: UIButton!
    @IBOutlet weak var gridCS_3_3: UIButton!
    @IBOutlet weak var gridCS_3_4: UIButton!
    @IBOutlet weak var gridCS_4: UIButton!
    @IBOutlet weak var gridCS_4_2: UIButton!
    @IBOutlet weak var gridCS_4_3: UIButton!
    @IBOutlet weak var gridCS_4_4: UIButton!
    
    /* func initCSRow */
    /// Initialises the note C# cells.
    ///
    func initCSRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridCS_1
            case 1:
                button = gridCS_1_2
            case 2:
                button = gridCS_1_3
            case 3:
                button = gridCS_1_4
            case 4:
                button = gridCS_2
            case 5:
                button = gridCS_2_2
            case 6:
                button = gridCS_2_3
            case 7:
                button = gridCS_2_4
            case 8:
                button = gridCS_3
            case 9:
                button = gridCS_3_2
            case 10:
                button = gridCS_3_3
            case 11:
                button = gridCS_3_4
            case 12:
                button = gridCS_4
            case 13:
                button = gridCS_4_2
            case 14:
                button = gridCS_4_3
            case 15:
                button = gridCS_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // D
    @IBOutlet weak var gridD_1: UIButton!
    @IBOutlet weak var gridD_1_2: UIButton!
    @IBOutlet weak var gridD_1_3: UIButton!
    @IBOutlet weak var gridD_1_4: UIButton!
    @IBOutlet weak var gridD_2: UIButton!
    @IBOutlet weak var gridD_2_2: UIButton!
    @IBOutlet weak var gridD_2_3: UIButton!
    @IBOutlet weak var gridD_2_4: UIButton!
    @IBOutlet weak var gridD_3: UIButton!
    @IBOutlet weak var gridD_3_2: UIButton!
    @IBOutlet weak var gridD_3_3: UIButton!
    @IBOutlet weak var gridD_3_4: UIButton!
    @IBOutlet weak var gridD_4: UIButton!
    @IBOutlet weak var gridD_4_2: UIButton!
    @IBOutlet weak var gridD_4_3: UIButton!
    @IBOutlet weak var gridD_4_4: UIButton!
    
    /* func initDRow */
    /// Initialises the note D cells.
    ///
    func initDRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridD_1
            case 1:
                button = gridD_1_2
            case 2:
                button = gridD_1_3
            case 3:
                button = gridD_1_4
            case 4:
                button = gridD_2
            case 5:
                button = gridD_2_2
            case 6:
                button = gridD_2_3
            case 7:
                button = gridD_2_4
            case 8:
                button = gridD_3
            case 9:
                button = gridD_3_2
            case 10:
                button = gridD_3_3
            case 11:
                button = gridD_3_4
            case 12:
                button = gridD_4
            case 13:
                button = gridD_4_2
            case 14:
                button = gridD_4_3
            case 15:
                button = gridD_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // D#
    @IBOutlet weak var gridDS_1: UIButton!
    @IBOutlet weak var gridDS_1_2: UIButton!
    @IBOutlet weak var gridDS_1_3: UIButton!
    @IBOutlet weak var gridDS_1_4: UIButton!
    @IBOutlet weak var gridDS_2: UIButton!
    @IBOutlet weak var gridDS_2_2: UIButton!
    @IBOutlet weak var gridDS_2_3: UIButton!
    @IBOutlet weak var gridDS_2_4: UIButton!
    @IBOutlet weak var gridDS_3: UIButton!
    @IBOutlet weak var gridDS_3_2: UIButton!
    @IBOutlet weak var gridDS_3_3: UIButton!
    @IBOutlet weak var gridDS_3_4: UIButton!
    @IBOutlet weak var gridDS_4: UIButton!
    @IBOutlet weak var gridDS_4_2: UIButton!
    @IBOutlet weak var gridDS_4_3: UIButton!
    @IBOutlet weak var gridDS_4_4: UIButton!
    
    /* func initDSRow */
    /// Initialises the note D# cells.
    ///
    func initDSRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridDS_1
            case 1:
                button = gridDS_1_2
            case 2:
                button = gridDS_1_3
            case 3:
                button = gridDS_1_4
            case 4:
                button = gridDS_2
            case 5:
                button = gridDS_2_2
            case 6:
                button = gridDS_2_3
            case 7:
                button = gridDS_2_4
            case 8:
                button = gridDS_3
            case 9:
                button = gridDS_3_2
            case 10:
                button = gridDS_3_3
            case 11:
                button = gridDS_3_4
            case 12:
                button = gridDS_4
            case 13:
                button = gridDS_4_2
            case 14:
                button = gridDS_4_3
            case 15:
                button = gridDS_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // E
    @IBOutlet weak var gridE_1: UIButton!
    @IBOutlet weak var gridE_1_2: UIButton!
    @IBOutlet weak var gridE_1_3: UIButton!
    @IBOutlet weak var gridE_1_4: UIButton!
    @IBOutlet weak var gridE_2: UIButton!
    @IBOutlet weak var gridE_2_2: UIButton!
    @IBOutlet weak var gridE_2_3: UIButton!
    @IBOutlet weak var gridE_2_4: UIButton!
    @IBOutlet weak var gridE_3: UIButton!
    @IBOutlet weak var gridE_3_2: UIButton!
    @IBOutlet weak var gridE_3_3: UIButton!
    @IBOutlet weak var gridE_3_4: UIButton!
    @IBOutlet weak var gridE_4: UIButton!
    @IBOutlet weak var gridE_4_2: UIButton!
    @IBOutlet weak var gridE_4_3: UIButton!
    @IBOutlet weak var gridE_4_4: UIButton!
    
    /* func initERow */
    /// Initialises the note E cells.
    ///
    func initERow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridE_1
            case 1:
                button = gridE_1_2
            case 2:
                button = gridE_1_3
            case 3:
                button = gridE_1_4
            case 4:
                button = gridE_2
            case 5:
                button = gridE_2_2
            case 6:
                button = gridE_2_3
            case 7:
                button = gridE_2_4
            case 8:
                button = gridE_3
            case 9:
                button = gridE_3_2
            case 10:
                button = gridE_3_3
            case 11:
                button = gridE_3_4
            case 12:
                button = gridE_4
            case 13:
                button = gridE_4_2
            case 14:
                button = gridE_4_3
            case 15:
                button = gridE_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // F
    @IBOutlet weak var gridF_1: UIButton!
    @IBOutlet weak var gridF_1_2: UIButton!
    @IBOutlet weak var gridF_1_3: UIButton!
    @IBOutlet weak var gridF_1_4: UIButton!
    @IBOutlet weak var gridF_2: UIButton!
    @IBOutlet weak var gridF_2_2: UIButton!
    @IBOutlet weak var gridF_2_3: UIButton!
    @IBOutlet weak var gridF_2_4: UIButton!
    @IBOutlet weak var gridF_3: UIButton!
    @IBOutlet weak var gridF_3_2: UIButton!
    @IBOutlet weak var gridF_3_3: UIButton!
    @IBOutlet weak var gridF_3_4: UIButton!
    @IBOutlet weak var gridF_4: UIButton!
    @IBOutlet weak var gridF_4_2: UIButton!
    @IBOutlet weak var gridF_4_3: UIButton!
    @IBOutlet weak var gridF_4_4: UIButton!
    
    /* func initFRow */
    /// Initialises the note F cells.
    ///
    func initFRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridF_1
            case 1:
                button = gridF_1_2
            case 2:
                button = gridF_1_3
            case 3:
                button = gridF_1_4
            case 4:
                button = gridF_2
            case 5:
                button = gridF_2_2
            case 6:
                button = gridF_2_3
            case 7:
                button = gridF_2_4
            case 8:
                button = gridF_3
            case 9:
                button = gridF_3_2
            case 10:
                button = gridF_3_3
            case 11:
                button = gridF_3_4
            case 12:
                button = gridF_4
            case 13:
                button = gridF_4_2
            case 14:
                button = gridF_4_3
            case 15:
                button = gridF_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // F#
    @IBOutlet weak var gridFS_1: UIButton!
    @IBOutlet weak var gridFS_1_2: UIButton!
    @IBOutlet weak var gridFS_1_3: UIButton!
    @IBOutlet weak var gridFS_1_4: UIButton!
    @IBOutlet weak var gridFS_2: UIButton!
    @IBOutlet weak var gridFS_2_2: UIButton!
    @IBOutlet weak var gridFS_2_3: UIButton!
    @IBOutlet weak var gridFS_2_4: UIButton!
    @IBOutlet weak var gridFS_3: UIButton!
    @IBOutlet weak var gridFS_3_2: UIButton!
    @IBOutlet weak var gridFS_3_3: UIButton!
    @IBOutlet weak var gridFS_3_4: UIButton!
    @IBOutlet weak var gridFS_4: UIButton!
    @IBOutlet weak var gridFS_4_2: UIButton!
    @IBOutlet weak var gridFS_4_3: UIButton!
    @IBOutlet weak var gridFS_4_4: UIButton!
    
    /* func initFSRow */
    /// Initialises the note F# cells.
    ///
    func initFSRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridFS_1
            case 1:
                button = gridFS_1_2
            case 2:
                button = gridFS_1_3
            case 3:
                button = gridFS_1_4
            case 4:
                button = gridFS_2
            case 5:
                button = gridFS_2_2
            case 6:
                button = gridFS_2_3
            case 7:
                button = gridFS_2_4
            case 8:
                button = gridFS_3
            case 9:
                button = gridFS_3_2
            case 10:
                button = gridFS_3_3
            case 11:
                button = gridFS_3_4
            case 12:
                button = gridFS_4
            case 13:
                button = gridFS_4_2
            case 14:
                button = gridFS_4_3
            case 15:
                button = gridFS_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // G
    @IBOutlet weak var gridG_1: UIButton!
    @IBOutlet weak var gridG_1_2: UIButton!
    @IBOutlet weak var gridG_1_3: UIButton!
    @IBOutlet weak var gridG_1_4: UIButton!
    @IBOutlet weak var gridG_2: UIButton!
    @IBOutlet weak var gridG_2_2: UIButton!
    @IBOutlet weak var gridG_2_3: UIButton!
    @IBOutlet weak var gridG_2_4: UIButton!
    @IBOutlet weak var gridG_3: UIButton!
    @IBOutlet weak var gridG_3_2: UIButton!
    @IBOutlet weak var gridG_3_3: UIButton!
    @IBOutlet weak var gridG_3_4: UIButton!
    @IBOutlet weak var gridG_4: UIButton!
    @IBOutlet weak var gridG_4_2: UIButton!
    @IBOutlet weak var gridG_4_3: UIButton!
    @IBOutlet weak var gridG_4_4: UIButton!
    
    /* func initGRow */
    /// Initialises the note G cells.
    ///
    func initGRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridG_1
            case 1:
                button = gridG_1_2
            case 2:
                button = gridG_1_3
            case 3:
                button = gridG_1_4
            case 4:
                button = gridG_2
            case 5:
                button = gridG_2_2
            case 6:
                button = gridG_2_3
            case 7:
                button = gridG_2_4
            case 8:
                button = gridG_3
            case 9:
                button = gridG_3_2
            case 10:
                button = gridG_3_3
            case 11:
                button = gridG_3_4
            case 12:
                button = gridG_4
            case 13:
                button = gridG_4_2
            case 14:
                button = gridG_4_3
            case 15:
                button = gridG_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // G#
    @IBOutlet weak var gridGS_1: UIButton!
    @IBOutlet weak var gridGS_1_2: UIButton!
    @IBOutlet weak var gridGS_1_3: UIButton!
    @IBOutlet weak var gridGS_1_4: UIButton!
    @IBOutlet weak var gridGS_2: UIButton!
    @IBOutlet weak var gridGS_2_2: UIButton!
    @IBOutlet weak var gridGS_2_3: UIButton!
    @IBOutlet weak var gridGS_2_4: UIButton!
    @IBOutlet weak var gridGS_3: UIButton!
    @IBOutlet weak var gridGS_3_2: UIButton!
    @IBOutlet weak var gridGS_3_3: UIButton!
    @IBOutlet weak var gridGS_3_4: UIButton!
    @IBOutlet weak var gridGS_4: UIButton!
    @IBOutlet weak var gridGS_4_2: UIButton!
    @IBOutlet weak var gridGS_4_3: UIButton!
    @IBOutlet weak var gridGS_4_4: UIButton!
    
    /* func initGSRow */
    /// Initialises the note G# cells.
    ///
    func initGSRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridGS_1
            case 1:
                button = gridGS_1_2
            case 2:
                button = gridGS_1_3
            case 3:
                button = gridGS_1_4
            case 4:
                button = gridGS_2
            case 5:
                button = gridGS_2_2
            case 6:
                button = gridGS_2_3
            case 7:
                button = gridGS_2_4
            case 8:
                button = gridGS_3
            case 9:
                button = gridGS_3_2
            case 10:
                button = gridGS_3_3
            case 11:
                button = gridGS_3_4
            case 12:
                button = gridGS_4
            case 13:
                button = gridGS_4_2
            case 14:
                button = gridGS_4_3
            case 15:
                button = gridGS_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // A
    @IBOutlet weak var gridA_1: UIButton!
    @IBOutlet weak var gridA_1_2: UIButton!
    @IBOutlet weak var gridA_1_3: UIButton!
    @IBOutlet weak var gridA_1_4: UIButton!
    @IBOutlet weak var gridA_2: UIButton!
    @IBOutlet weak var gridA_2_2: UIButton!
    @IBOutlet weak var gridA_2_3: UIButton!
    @IBOutlet weak var gridA_2_4: UIButton!
    @IBOutlet weak var gridA_3: UIButton!
    @IBOutlet weak var gridA_3_2: UIButton!
    @IBOutlet weak var gridA_3_3: UIButton!
    @IBOutlet weak var gridA_3_4: UIButton!
    @IBOutlet weak var gridA_4: UIButton!
    @IBOutlet weak var gridA_4_2: UIButton!
    @IBOutlet weak var gridA_4_3: UIButton!
    @IBOutlet weak var gridA_4_4: UIButton!
    
    /* func initARow */
    /// Initialises the note A cells.
    ///
    func initARow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridA_1
            case 1:
                button = gridA_1_2
            case 2:
                button = gridA_1_3
            case 3:
                button = gridA_1_4
            case 4:
                button = gridA_2
            case 5:
                button = gridA_2_2
            case 6:
                button = gridA_2_3
            case 7:
                button = gridA_2_4
            case 8:
                button = gridA_3
            case 9:
                button = gridA_3_2
            case 10:
                button = gridA_3_3
            case 11:
                button = gridA_3_4
            case 12:
                button = gridA_4
            case 13:
                button = gridA_4_2
            case 14:
                button = gridA_4_3
            case 15:
                button = gridA_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // A#
    @IBOutlet weak var gridAS_1: UIButton!
    @IBOutlet weak var gridAS_1_2: UIButton!
    @IBOutlet weak var gridAS_1_3: UIButton!
    @IBOutlet weak var gridAS_1_4: UIButton!
    @IBOutlet weak var gridAS_2: UIButton!
    @IBOutlet weak var gridAS_2_2: UIButton!
    @IBOutlet weak var gridAS_2_3: UIButton!
    @IBOutlet weak var gridAS_2_4: UIButton!
    @IBOutlet weak var gridAS_3: UIButton!
    @IBOutlet weak var gridAS_3_2: UIButton!
    @IBOutlet weak var gridAS_3_3: UIButton!
    @IBOutlet weak var gridAS_3_4: UIButton!
    @IBOutlet weak var gridAS_4: UIButton!
    @IBOutlet weak var gridAS_4_2: UIButton!
    @IBOutlet weak var gridAS_4_3: UIButton!
    @IBOutlet weak var gridAS_4_4: UIButton!
    
    /* func initASRow */
    /// Initialises the note A# cells.
    ///
    func initASRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridAS_1
            case 1:
                button = gridAS_1_2
            case 2:
                button = gridAS_1_3
            case 3:
                button = gridAS_1_4
            case 4:
                button = gridAS_2
            case 5:
                button = gridAS_2_2
            case 6:
                button = gridAS_2_3
            case 7:
                button = gridAS_2_4
            case 8:
                button = gridAS_3
            case 9:
                button = gridAS_3_2
            case 10:
                button = gridAS_3_3
            case 11:
                button = gridAS_3_4
            case 12:
                button = gridAS_4
            case 13:
                button = gridAS_4_2
            case 14:
                button = gridAS_4_3
            case 15:
                button = gridAS_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    // B
    @IBOutlet weak var gridB_1: UIButton!
    @IBOutlet weak var gridB_1_2: UIButton!
    @IBOutlet weak var gridB_1_3: UIButton!
    @IBOutlet weak var gridB_1_4: UIButton!
    @IBOutlet weak var gridB_2: UIButton!
    @IBOutlet weak var gridB_2_2: UIButton!
    @IBOutlet weak var gridB_2_3: UIButton!
    @IBOutlet weak var gridB_2_4: UIButton!
    @IBOutlet weak var gridB_3: UIButton!
    @IBOutlet weak var gridB_3_2: UIButton!
    @IBOutlet weak var gridB_3_3: UIButton!
    @IBOutlet weak var gridB_3_4: UIButton!
    @IBOutlet weak var gridB_4: UIButton!
    @IBOutlet weak var gridB_4_2: UIButton!
    @IBOutlet weak var gridB_4_3: UIButton!
    @IBOutlet weak var gridB_4_4: UIButton!
    
    /* func initBRow */
    /// Initialises the note B cells.
    ///
    func initBRow() {
        var gridCell: CellObject
        var button: UIButton!
        
        for i in 0...15 {
            switch i {
            case 0:
                button = gridB_1
            case 1:
                button = gridB_1_2
            case 2:
                button = gridB_1_3
            case 3:
                button = gridB_1_4
            case 4:
                button = gridB_2
            case 5:
                button = gridB_2_2
            case 6:
                button = gridB_2_3
            case 7:
                button = gridB_2_4
            case 8:
                button = gridB_3
            case 9:
                button = gridB_3_2
            case 10:
                button = gridB_3_3
            case 11:
                button = gridB_3_4
            case 12:
                button = gridB_4
            case 13:
                button = gridB_4_2
            case 14:
                button = gridB_4_3
            case 15:
                button = gridB_4_4
            default:
                print(GridViewController.ERROR_1)
            }
            gridCell = CellObject.init(button: button)
            GridViewController.gridButtons.append(gridCell)
        }
    }
    
    /* STEPs CELLS*/
    
    @IBOutlet weak var stepIndicator1: UIButton!
    @IBOutlet weak var stepIndicator12: UIButton!
    @IBOutlet weak var stepIndicator13: UIButton!
    @IBOutlet weak var stepIndicator14: UIButton!
    @IBOutlet weak var stepIndicator2: UIButton!
    @IBOutlet weak var stepIndicator22: UIButton!
    @IBOutlet weak var stepIndicator23: UIButton!
    @IBOutlet weak var stepIndicator24: UIButton!
    @IBOutlet weak var stepIndicator3: UIButton!
    @IBOutlet weak var stepIndicator32: UIButton!
    @IBOutlet weak var stepIndicator33: UIButton!
    @IBOutlet weak var stepIndicator34: UIButton!
    @IBOutlet weak var stepIndicator4: UIButton!
    @IBOutlet weak var stepIndicator42: UIButton!
    @IBOutlet weak var stepIndicator43: UIButton!
    @IBOutlet weak var stepIndicator44: UIButton!
    
    /* ERRORS */
    
    private static let ERROR_1 = "ERROR: Error trying to call a button. Please check tags in MainStoryboard.swift Grid view."
    
    /* CONTROL FLOW */
    public static var executionDiff: CFAbsoluteTime!
    
    
    
    /* FUNCTIONS */
    
    /* func viewDidLoad */
    /// Sets up the Grid view and its initial elements.
    ///
    override func viewDidLoad() {
        let start = CFAbsoluteTimeGetCurrent()
        GridViewController.executionStart = start
        
        super.viewDidLoad()
        gridModel = GridModel()
        initRows()
        initSteps()
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Loading Grid View took \(diff) seconds.")
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
    override func prefersHomeIndicatorAutoHidden() -> Bool  {
        return true
    }
    
    /* func initRows */
    /// Initializes all the grid's buttons, by calling each row init function.
    ///
    func initRows(){
        initCRow()
        initCSRow()
        initDRow()
        initDSRow()
        initERow()
        initFRow()
        initFSRow()
        initGRow()
        initGSRow()
        initARow()
        initASRow()
        initBRow()
    }
    
    /* func initSteps */
    /// Initializes the step indicator positions.
    ///
    func initSteps(){
        StepModel.stepArray.append(stepIndicator1)
        StepModel.stepArray.append(stepIndicator12)
        StepModel.stepArray.append(stepIndicator13)
        StepModel.stepArray.append(stepIndicator14)
        StepModel.stepArray.append(stepIndicator2)
        StepModel.stepArray.append(stepIndicator22)
        StepModel.stepArray.append(stepIndicator23)
        StepModel.stepArray.append(stepIndicator24)
        StepModel.stepArray.append(stepIndicator3)
        StepModel.stepArray.append(stepIndicator32)
        StepModel.stepArray.append(stepIndicator33)
        StepModel.stepArray.append(stepIndicator34)
        StepModel.stepArray.append(stepIndicator4)
        StepModel.stepArray.append(stepIndicator42)
        StepModel.stepArray.append(stepIndicator43)
        StepModel.stepArray.append(stepIndicator44)
        GridViewController.stepModel = StepModel.init()
    }
    
    /*  func cellPressed */
    /// Handles the events triggered when a cell is pressed.
    /// - Parameter sender: UIButton corresponding to the pressed cell.
    /// 
    @IBAction func cellPressed(_ sender: UIButton) {
        let cell = gridModel.getCell(order: sender.tag)
        if  cell.isPressed {
            sender.setImage(UIImage(named: "ACID ME!_cellTransparent.png"), for: .normal)
        } else {
            if cell.isWhite {
                sender.setImage(UIImage(named: "ACID ME!_whiteKeyPressed.png"), for: .normal)
            } else {
                sender.setImage(UIImage(named: "ACID ME!_blackKeyPressed.png"), for: .normal)
            }
        }
        gridModel.updateCellStatus(cell: cell)
    }
}
