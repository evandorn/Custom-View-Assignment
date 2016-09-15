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
    
    var startingColor: NSColor?
    var endingColor: NSColor?
    var innerFrame: NSRect?
    var roundedPath: NSBezierPath?
    
    override func awakeFromNib() {
       // let click = NSClickGestureRecognizer(target: self, action: "click:")
       // addGestureRecognizer(click)
    }
    
    // Used to draw things on the view
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        // Drawing code here....
        // Just an example of how to use NSView to draw things
        let backgroundColor = NSColor.lightGrayColor()
        backgroundColor.set()
        NSBezierPath.fillRect(bounds)
        
        NSColor.greenColor().set()
        let path = NSBezierPath()
        path.moveToPoint(NSPoint(x: 0, y: 0))
        path.lineToPoint(NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
        
        let innerFrame = bounds.insetBy(dx: 10, dy: 10)
        let roundedPath = NSBezierPath(roundedRect: innerFrame, xRadius: 20, yRadius: 20)
        roundedPath.fill()
        
        self.innerFrame = innerFrame
        self.roundedPath = roundedPath
    }
    
    /*
    func click(gesture: NSClickGestureRecognizer) {
        Swift.print("click")
        
        if let innerFrame = innerFrame where innerFrame.contains(gesture.locationInView(self)) {
            Swift.print("inside")
        }
        if let roundedPath = roundedPath where roundedPath.containsPoint(gesture.locationInView(self)) {
            Swift.print("inside BeszierPath")
        }
    }
 */
    
}
