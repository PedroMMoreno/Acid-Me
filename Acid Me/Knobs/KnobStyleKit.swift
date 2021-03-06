//
//  KnobStyleKit.swift
//  Acid Me!
//
//  Created by Matthew Fecher on 9/19/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//  Source: 3D Image Knob Example https://github.com/analogcode/3D-Knobs
//
//  Edited by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//

import UIKit

///
/// KnobStyleKit builds and draws a knob, with several characteristics.
///
/// - author: Matthew Fecher
/// - Date: 9/19/2017.
///
public class KnobStyleKit : NSObject {

    /* Drawing Methods */

    @objc dynamic public class func drawFMKnob(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 124, height: 124), resizing: ResizingBehavior = .aspectFit, knobValue: CGFloat = 0.5) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 124, height: 124), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 124, y: resizedFrame.height / 124)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 124, resizedFrame.height / 124)


        //// Color Declarations
        let black = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        let indicatorColor = UIColor(red: 0.855, green: 0.914, blue: 0.918, alpha: 1.000)
        let knobBottom = UIColor(red: 0.180, green: 0.180, blue: 0.192, alpha: 1.000)
        let knobLight = UIColor(red: 0.498, green: 0.498, blue: 0.510, alpha: 1.000)
        let knobTop2 = UIColor(red: 0.141, green: 0.141, blue: 0.161, alpha: 1.000)

        //// Gradient Declarations
        let edge2 = CGGradient(colorsSpace: nil, colors: [knobBottom.cgColor, knobBottom.blended(withFraction: 0.5, of: knobTop2).cgColor, knobTop2.cgColor, knobTop2.blended(withFraction: 0.5, of: knobLight).cgColor, knobLight.cgColor] as CFArray, locations: [0, 0.23, 0.41, 0.73, 1])!
        let lowerKnobGradient2 = CGGradient(colorsSpace: nil, colors: [knobTop2.cgColor, knobBottom.cgColor, knobLight.cgColor] as CFArray, locations: [0, 0.51, 1])!

        //// Shadow Declarations
        let shadow2 = NSShadow()
        shadow2.shadowColor = UIColor.black.withAlphaComponent(0.46)
        shadow2.shadowOffset = CGSize(width: 2, height: 8)
        shadow2.shadowBlurRadius = 5
        let shadow3 = NSShadow()
        shadow3.shadowColor = knobLight.withAlphaComponent(0.41 * knobLight.cgColor.alpha)
        shadow3.shadowOffset = CGSize(width: 0, height: 10)
        shadow3.shadowBlurRadius = 5
        let shadow = NSShadow()
        shadow.shadowColor = indicatorColor
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 8

        //// Variable Declarations
        let knobAngle: CGFloat = -240 * knobValue

        //// Knob
        context.saveGState()



        //// BlackBackground Drawing
        let blackBackgroundPath = UIBezierPath(ovalIn: CGRect(x: 4, y: 4, width: 120, height: 120))
        black.setFill()
        blackBackgroundPath.fill()


        //// GradientKnob 2 Drawing
        let gradientKnob2Path = UIBezierPath(ovalIn: CGRect(x: 13, y: 13, width: 102, height: 102))
        context.saveGState()
        gradientKnob2Path.addClip()
        context.drawLinearGradient(lowerKnobGradient2, start: CGPoint(x: 64, y: 115), end: CGPoint(x: 64, y: 13), options: [])
        context.restoreGState()


        //// GradientKnob Drawing
        let gradientKnobPath = UIBezierPath(ovalIn: CGRect(x: 19, y: 19, width: 90, height: 90))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        gradientKnobPath.addClip()
        context.drawLinearGradient(edge2, start: CGPoint(x: 64, y: 109), end: CGPoint(x: 64, y: 19), options: [])
        context.endTransparencyLayer()

        ////// GradientKnob Inner Shadow
        context.saveGState()
        context.clip(to: gradientKnobPath.bounds)
        context.setShadow(offset: CGSize.zero, blur: 0)
        context.setAlpha((shadow3.shadowColor as! UIColor).cgColor.alpha)
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        let gradientKnobOpaqueShadow = (shadow3.shadowColor as! UIColor).withAlphaComponent(1)
        context.setShadow(offset: CGSize(width: shadow3.shadowOffset.width * resizedShadowScale, height: shadow3.shadowOffset.height * resizedShadowScale), blur: shadow3.shadowBlurRadius * resizedShadowScale, color: gradientKnobOpaqueShadow.cgColor)
        context.setBlendMode(.sourceOut)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        gradientKnobOpaqueShadow.setFill()
        gradientKnobPath.fill()

        context.endTransparencyLayer()
        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()



        //// IndicatorGroup
        //// Indicator Drawing
        context.saveGState()
        context.translateBy(x: 64, y: 64)
        context.rotate(by: -(knobAngle - 240) * CGFloat.pi/180)

        let indicatorPath = UIBezierPath(rect: CGRect(x: -3, y: -45, width: 6, height: 35))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        indicatorColor.setFill()
        indicatorPath.fill()
        context.restoreGState()


        context.restoreGState()





        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(KnobStyleKit2ResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}



private extension UIColor {
    func blended(withFraction fraction: CGFloat, of color: UIColor) -> UIColor {
        var r1: CGFloat = 1, g1: CGFloat = 1, b1: CGFloat = 1, a1: CGFloat = 1
        var r2: CGFloat = 1, g2: CGFloat = 1, b2: CGFloat = 1, a2: CGFloat = 1

        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return UIColor(red: r1 * (1 - fraction) + r2 * fraction,
            green: g1 * (1 - fraction) + g2 * fraction,
            blue: b1 * (1 - fraction) + b2 * fraction,
            alpha: a1 * (1 - fraction) + a2 * fraction);
    }
}

