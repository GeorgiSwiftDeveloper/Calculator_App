//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Georgi Malkhasyan on 2/3/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private   var number: Double?
    private var intermediateCalculation: (n1: Double, calculatorMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    mutating func calculatorLogic(symbol: String) -> Double?  {
        if let n  = number  {
            switch symbol {
            case "+/-":
                return n * 1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNum(n2: n)
            default:
                intermediateCalculation = (n1: n, calculatorMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNum(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let opration = intermediateCalculation?.calculatorMethod {
            switch opration {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match")
            }
        }
        return nil
    }
}
