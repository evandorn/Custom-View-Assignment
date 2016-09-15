//
//  WindowController.swift
//  CustomView
//
//  Created by Evan Dorn on 9/14/16.
//  Copyright © 2016 evandorn. All rights reserved.
//

import Foundation
import Cocoa

class WindowController: NSWindowController {
    
    // class variables
    let defaultBorderThickness: Double = 10.0
    let maxBorderThickness: Double = 60.0
    
    @IBOutlet weak var borderColorWell: NSColorWell!
    @IBOutlet weak var gradientCheckbox: NSButton!
    @IBOutlet weak var bottomColorWell: NSColorWell!
    @IBOutlet weak var topColorWell: NSColorWell!
    
    override func awakeFromNib() {
        clickedGradientCheckbox(self)
    }
    
    @IBAction func displayBorderSwitches(sender: AnyObject) {
        
    }
    
    @IBAction func bottomGradientColorSelection(sender: AnyObject) {
    }
    
    
    @IBAction func topGradientColorSelection(sender: AnyObject) {
        
    }
    
    
    @IBAction func clickedGradientCheckbox(sender: AnyObject) {
        if gradientCheckbox.state == NSOnState {
            // make the gradient
            print("Gradient currently displayed")
        } else if gradientCheckbox.state == NSOffState {
            // display no gradient
            print("No Gradient currently displayed")
        }
    }
    
    
    @IBAction func borderColorSelection(sender: AnyObject) {
        
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.title = "RV Custom View"
    }
}