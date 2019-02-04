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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        didCheckNumber = true
        guard  let number = Double(displayLabel.text!) else {
            return
        }
        if let calckMethod = sender.currentTitle {
            switch calckMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayLabel.text = String(number / 100)
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
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        return
                    }
                      let isInt = floor(currentDisplayValue)  == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }

}

