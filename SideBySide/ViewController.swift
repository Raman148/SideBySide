//
//  ViewController.swift
//  SplitCompanion
//
//  Created by Raman on 9/25/15.
//  Copyright © 2015 Raman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider?
    
    let wormhole = MMWormhole(
        applicationGroupIdentifier: "group.com.raynanda.sidebyside",
        optionalDirectory: "SideBySide")
    
    let sliderID = "Slider"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sliderValue = wormhole.messageWithIdentifier(sliderID) as? Float {
            slider?.value = sliderValue
        }
        
        wormhole.listenForMessageWithIdentifier(sliderID) { (data: AnyObject?) in
            if let value = data as? Float {
                self.slider?.value = value
            }
        }
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        wormhole.passMessageObject(sender.value as Float, identifier: sliderID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

