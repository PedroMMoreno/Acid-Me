//
//  ButtonPackage.swift
//  Acid Me!
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import UIKit

///
/// ButtonPackage compiles all the useful information of a specific button in order to handle its state changes. It allows the program to change its corresponding images for the "pressed" state and to turn on the led for those how have an associated one.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
open class ButtonPackage  {
    
    /* VARIABLES */
    var order: Int
    var mainImage: UIImageView!
    var secondImage: UIImageView!
    var ledImage: UIImageView!
    var hasLed: Bool
    var ledON: Bool = false
    var isPressed: Bool
    var hasMainImage: Bool
    
    /* init */
    /// Inittialises a button's associated ButtonPackage object and its properties.
    /// - Parameter order: indicates the button type.
    /// - Parameter image: button's image.
    /// - Parameter hasLed: indicates wether the button has an associated led or not.
    /// - Parameter isPressed: indicates if the button is currently pressed or not.
    /// - Parameter ledImage: the associated led image.
    /// - Parameter hasMainImage:indicates wether the button has a main image to be shown or not.
    /// - Parameter mainImage: button's main image.
    ///
    init(order: Int, image: UIImageView,hasLed: Bool, isPressed: Bool, ledImage: UIImageView, hasMainImage: Bool, mainImage: UIImageView){
        self.order = order
        image.isHidden = true
        
        self.secondImage = image
        self.isPressed = isPressed
        
        self.hasMainImage = hasMainImage
        if hasMainImage {
            self.mainImage = mainImage
        }
        
        self.hasLed = hasLed
        if hasLed {
            self.ledImage = ledImage
        }
        
        self.turnLedOn(on: false)
    }
    
    
    /* func turnLedOn */
    ///  Turns the led on by unhiding the led image.
    /// - Parameter on:  flag that indicates if the led is currently on or off.
    ///
    func turnLedOn(on: Bool){
        if hasLed {
            self.ledON = on
            self.ledImage.isHidden = !on
        }
    }
}
