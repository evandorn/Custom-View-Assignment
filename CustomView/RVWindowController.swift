//
//  WindowController.swift
//  CustomView
//
//  Created by Evan Dorn on 9/14/16.
//  Copyright © 2016 evandorn. All rights reserved.
//

import Foundation
import Cocoa

class RVWindowController: NSWindowController {
    
    var isGradient: Bool?
    
    @IBOutlet weak var rightButton: NSButton!
    @IBOutlet weak var leftButton: NSButton!
    @IBOutlet weak var bottomButton: NSButton!
    @IBOutlet weak var topButton: NSButton!
    @IBOutlet weak var allButton: NSButton!
    @IBOutlet weak var borderColorWell: NSColorWell!
    @IBOutlet weak var gradientCheckbox: NSButton!
    @IBOutlet weak var bottomColorWell: NSColorWell!
    @IBOutlet weak var topColorWell: NSColorWell!
    @IBOutlet weak var textField: NSTextField!
    
    func setButtonStates() {
        allButton.state = NSOffState
        rightButton.state = NSOffState
        leftButton.state = NSOffState
        bottomButton.state = NSOffState
        topButton.state = NSOffState
    }
    
    override func awakeFromNib() {
        clickedGradientCheckbox(self)
        setButtonStates()
    }
    
  var customView: RVContentView {
    get {
      return window?.contentView as! RVContentView
    }
  }

    @IBAction func borderThicknessEntered(sender: AnyObject) {
        customView.contentView?.currentBorderThickness = textField.floatValue
        textField.stringValue = ("\(textField.doubleValue)")
        customView.contentView?.needsDisplay = true
    }
  
    @IBAction func displayBorderSwitches(sender: AnyObject) {
        if(allButton.state == NSOnState) {
            customView.contentView?.allBorderSelection = true
            customView.contentView?.needsDisplay = true
        } else if(allButton.state == NSOffState) {
            customView.contentView?.allBorderSelection = false
            customView.contentView?.needsDisplay = true
        }
        if(rightButton.state == NSOnState) {
            customView.contentView?.rightBorderSelection = true
            customView.contentView?.needsDisplay = true
        } else if(rightButton.state == NSOffState) {
            customView.contentView?.rightBorderSelection = false
            customView.contentView?.needsDisplay = true
        }
        if(leftButton.state == NSOnState) {
            customView.contentView?.leftBorderSelection = true
            customView.contentView?.needsDisplay = true
        } else if(leftButton.state == NSOffState) {
            customView.contentView?.leftBorderSelection = false
            customView.contentView?.needsDisplay = true
        }
        if(topButton.state == NSOnState) {
            customView.contentView?.topBorderSelection = true
            customView.contentView?.needsDisplay = true
        } else if(topButton.state == NSOffState) {
            customView.contentView?.topBorderSelection = false
            customView.contentView?.needsDisplay = true
        }
        if(bottomButton.state == NSOnState) {
            customView.contentView?.bottomBorderSelection = true
            customView.contentView?.needsDisplay = true
        } else if(bottomButton.state == NSOffState) {
            customView.contentView?.bottomBorderSelection = false
            customView.contentView?.needsDisplay = true
        }
    }
    
    @IBAction func bottomGradientColorSelection(sender: AnyObject) {
        customView.contentView?.bottomColor = bottomColorWell.color
        customView.contentView?.needsDisplay = true
    }
    
    @IBAction func topGradientColorSelection(sender: AnyObject) {
        customView.contentView?.topColor = topColorWell.color
        customView.contentView?.needsDisplay = true
    }
    
    @IBAction func clickedGradientCheckbox(sender: AnyObject) {
        if gradientCheckbox.state == NSOnState {
            isGradient = true
            customView.contentView?.updateGradient(isGradient!)
            customView.contentView?.needsDisplay = true
        } else if gradientCheckbox.state == NSOffState {
            isGradient = false
            customView.contentView?.updateGradient(isGradient!)
            customView.contentView?.needsDisplay = true
        }
    }
    
    @IBAction func borderColorSelection(sender: AnyObject) {
        customView.contentView?.borderColor = borderColorWell.color
        customView.contentView?.needsDisplay = true
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window?.title = "RV Custom View"
    }
  
  override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
  }
}