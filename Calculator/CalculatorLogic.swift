//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Georgi Malkhasyan on 2/3/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double
    init(number: Double) {
        self.number = number
    }
    
    mutating func calculatorLogic(symbol: String) -> Double?  {
        switch symbol {
        case "+/-":
            number *= -1
        case "AC":
           return  0 
        case "%":
            number *= 0.01
        default:
            break
        }
        return nil
    }
}
