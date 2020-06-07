//
//  InterfaceController.swift
//  SunBurnTracker WatchKit Extension
//
//  Created by Graham Sela on 2020-06-07.
//  Copyright © 2020 Graham Sela. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var sunBurnCountdown: WKInterfaceTimer!
    
    @IBOutlet weak var uVIndexLabel: WKInterfaceLabel!
    
    @IBOutlet weak var uvIncrease: WKInterfaceButton!
    
    @IBOutlet weak var uvDecrease: WKInterfaceButton!
    
    @IBOutlet weak var skinToneIncrease: WKInterfaceButton!
    
    @IBOutlet weak var skinToneDecrease: WKInterfaceButton!
    
    @IBOutlet weak var skinToneLabel: WKInterfaceLabel!
    
    @IBOutlet weak var updateTimerButton: WKInterfaceButton!
    
    var uvIndex: Int = 1
    var skinTone: Int = 0
    
    let skinTones = ["Very Fair", "Fair", "Olive", "Brown", "Dark Brown and Black"]
    let sed = ["Very Fair": 1, "Fair": 2, "Olive": 4, "Brown": 5, "Dark Brown and Black": 7]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        uVIndexLabel.setText("UV Index \(uvIndex)")
        skinToneLabel.setText("Skin Tone: \(skinTones[skinTone])")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func updateSkin() {
        skinToneLabel.setText("Skin Tone: \(skinTones[skinTone])")
    }
    
    func updateUV() {
        uVIndexLabel.setText("UV Index: \(uvIndex)")
    }

    @IBAction func uvIncreased() {
        if uvIndex < 11 {
            uvIndex += 1
            
            updateUV()
        }
    }
    
    @IBAction func uvDecreased() {
        if uvIndex > 1 {
            uvIndex -= 1
            
            updateUV()
        }
    }
    
    @IBAction func skinToneIncreased() {
        if skinTone < 4 {
            skinTone += 1
            
            updateSkin()
        }
        
    }

    @IBAction func skinToneDecreased() {
        if skinTone > 0 {
            skinTone -= 1
            
            updateSkin()
        }
    }
    
    @IBAction func updateTimer() {
        let countdown = ((60/(uvIndex)) * (sed[skinTones[skinTone]]!)) * 60
        
        sunBurnCountdown.setDate(Date.init(timeIntervalSinceNow: Double(countdown)))
        sunBurnCountdown.start()
    }
    
}
