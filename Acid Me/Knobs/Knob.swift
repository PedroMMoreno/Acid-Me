//
//  KnobView.swift
//  Acid Me!
//
//  Created by Matthew Fecher on 9/19/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//  Source: 3D Image Knob Example @ https://github.com/analogcode/3D-Knobs
//
//  Edited by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//

import UIKit
 
///
/// Knob sets up the knob's initial values needed to work.
///
/// - author: Matthew Fecher
/// - Date: 9/19/2017.
///
@IBDesignable public class Knob: UIView {

    var callback: (Double) -> Void = { _ in }
    
    @IBInspectable var minimum: Double = 0.0 {
        didSet {
          setNeedsDisplay()
        }
    }

    @IBInspectable var maximum: Double = 1.0 {
        didSet {
          setNeedsDisplay()
        }
    }

    @IBInspectable var value: Double = 0.5 {
          didSet {
            if value > maximum {
                value = maximum
            }
            if value < minimum {
                value = minimum
            }
            setNeedsDisplay()
        }
    }
    
    // Knob properties
    var knobValue: CGFloat {
        return CGFloat((value - minimum) / (maximum - minimum))
    }

    var knobFill: CGFloat = 0
    var knobSensitivity = 0.005
    var lastX: CGFloat = 0
    var lastY: CGFloat = 0
    
    // Init / Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .redraw
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isUserInteractionEnabled = true
        contentMode = .redraw
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    public class override var requiresConstraintBasedLayout: Bool {
        return true
    }
    
   public override func draw(_ rect: CGRect) {
        KnobStyleKit.drawFMKnob(frame: CGRect(x:0,y:0, width: self.bounds.width, height: self.bounds.height), knobValue: knobValue)
    }
   
    
    // Helper
    func setPercentagesWithTouchPoint(_ touchPoint: CGPoint) {
        // Knobs assume up or right is increasing, and down or left is decreasing
        
        let horizontalChange = Double(touchPoint.x - lastX) * knobSensitivity
        value += horizontalChange * (maximum - minimum)

        let verticalChange = Double(touchPoint.y - lastY) * knobSensitivity
        value -= verticalChange * (maximum - minimum)
        
        callback(value)
        lastX = touchPoint.x
        lastY = touchPoint.y
    }
}
