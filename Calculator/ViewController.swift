//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private  var didCheckNumber: Bool = true
    private var displayValue: Double {
        get {
            guard  let number = Double(displayLabel.text!) else {fatalError("cant conver")}
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        didCheckNumber = true
        if let calckMethod = sender.currentTitle {
            switch calckMethod {
            case "+/-":
                displayValue *= -1
            case "AC":
                displayLabel.text = "0"
            case "%":
               displayValue *= 0.01
            default:
                break
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if didCheckNumber == true {
                displayLabel.text = numValue
                didCheckNumber = false
            }else {
                if numValue == "." {
                      let isInt = floor(displayValue)  == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }

}

