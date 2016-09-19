//
//  ViewController.swift
//  CustomView
//
//  Created by Evan Dorn on 9/13/16.
//  Copyright © 2016 evandorn. All rights reserved.
//

import Cocoa

class RVViewController: NSViewController {
    @IBOutlet weak var customView: RVCustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
  
  override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
    
  }
}
