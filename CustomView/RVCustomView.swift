//
//  RVCustomView.swift
//  CustomView
//
//  Created by Evan Dorn on 9/13/16.
//  Copyright © 2016 evandorn. All rights reserved.
//

import Foundation
import Cocoa
import CoreGraphics

class RVCustomView: NSView {
    var topColor: NSColor? = NSColor.redColor()
    var bottomColor: NSColor? = NSColor.whiteColor()
    var borderColor: NSColor? = NSColor.blackColor()
    var gradientAngle: CGFloat? = -90.0
    var innerFrame: NSRect?
    var roundedPath: NSBezierPath?
    var currentGradient: Bool? = true
    
    var allBorderSelection: Bool? = false
    var topBorderSelection: Bool? = false
    var bottomBorderSelection: Bool? = false
    var leftBorderSelection: Bool? = false
    var rightBorderSelection: Bool? = false 
    
    var currentBorderThickness: Float = 10.0
    
    @IBOutlet weak var myCustomView: NSView!
    
    override func awakeFromNib() {
        
    }
    
    func updateGradient(newGradient: Bool) {
        self.currentGradient = newGradient
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        var actualTopColor = topColor
        var actualBottomColor = bottomColor
        
        if actualTopColor == nil {
            if actualBottomColor != nil {
                actualTopColor = actualBottomColor
            } else {
                actualTopColor = NSColor.blackColor()
            }
        }
        if actualBottomColor == nil {
            actualBottomColor = actualTopColor
        }
        if(currentGradient == false) {
            let backgroundColor = topColor
            backgroundColor!.set()
            NSBezierPath.fillRect(bounds)
        } else if(currentGradient == true) {
            let gradient = NSGradient(startingColor: actualTopColor!, endingColor: actualBottomColor!)
            gradient!.drawInRect(self.bounds, angle: gradientAngle!)
        }
        drawViewBorder()
    }
    
    func drawViewBorder() {
        let context: CGContext! = NSGraphicsContext.currentContext()?.CGContext
        let borderThickness:CGFloat = CGFloat(currentBorderThickness)
        
        CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
        CGContextSetLineWidth(context, borderThickness)
        if(allBorderSelection == true) {
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, 0)
            CGContextAddLineToPoint(context, 0, self.frame.size.height)
            CGContextStrokePath(context);
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, self.frame.size.width, 0)
            CGContextStrokePath(context);
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, self.frame.size.height);
            CGContextAddLineToPoint(context, self.frame.size.width,self.frame.size.height)
            CGContextStrokePath(context);
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context,self.frame.size.width,self.frame.size.height)
            CGContextAddLineToPoint(context,self.frame.size.width,0)
            CGContextStrokePath(context)
        }
        if(leftBorderSelection == true) {
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, 0)
            CGContextAddLineToPoint(context, 0, self.frame.size.height)
            CGContextStrokePath(context)
        }
        if(topBorderSelection == true) {
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, self.frame.size.height)
            CGContextAddLineToPoint(context, self.frame.size.width,self.frame.size.height)
            CGContextStrokePath(context)
        }
        if(rightBorderSelection == true) {
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context,self.frame.size.width,self.frame.size.height)
            CGContextAddLineToPoint(context,self.frame.size.width,0)
            CGContextStrokePath(context)
        }
        if(bottomBorderSelection == true) {
            CGContextSetStrokeColorWithColor(context, self.borderColor!.CGColor)
            CGContextMoveToPoint(context, 0, 0)
            CGContextAddLineToPoint(context, self.frame.size.width, 0)
            CGContextStrokePath(context)
        }
    }
}
