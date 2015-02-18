//
//  CalculatorClass.swift
//  Calculator
//
//  Created by Luyuan Xing on 2/9/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class CalculatorClass {
    
    init() {
        
    }
    
    //Text from LABELS 
    var equationString: String?
    var resultDisplay: String? = "0"
    
    
    //get DOUBLE from label.text
    var currentNumberValue: Double {
        get {
            return NSNumberFormatter().numberFromString(resultDisplay!)!.doubleValue
        }
        set {
            resultDisplay = "\(newValue)"
            appending = false
            println("current number = \(currentNumberValue)")
        }
    }
    
    
    //BOOL for APPENDING
    var appending = false
    
    var arrayOfNumbers = [Double]()
    var arrayOfOperations = [String]()
    
    
    
    //APPENDING DIGITS
    func appendDigits(sender: BorderedButton) {
        
        let character = sender.currentTitle
        
        if appending {
            
            if character == "." {
                if let textString = resultDisplay {
                    if textString.rangeOfString(".") != nil {
                        println("can't add more decimals")
                    } else {
                        resultDisplay = textString + character!
                        equationString = equationString! + character!
                    }
                }
            } else {
                println("no decimals or correct decimals")
                resultDisplay = resultDisplay! + character!
                equationString = equationString! + character!
            }
            
        } else {
            if character != "0" {
                equationString = equationString! + character!
                resultDisplay = character!
                appending = true
                
                ///////////
                //       //
                //  STOP //
                //       //
                ///////////
                
                //  how to get the title from arrayOfButtons[0]??

                //______.setTitle("C", forState: UIControlState.Normal)
                
            }
        }
    }
    
    
    
    //CLEAR button
    func clearPressed(sender: BorderedButton) {
        resultDisplay = "0"
        
        if sender.currentTitle == "AC" {
            equationString = ""
            resultDisplay = "0"
            arrayOfNumbers = []
            arrayOfOperations = []
        } else if sender.currentTitle == "C" {
            resultDisplay = "0"
        }
        
    }
    
    
    //UNARY OPERATORS
    func operateUnary(sender: BorderedButton) {
        let character = sender.currentTitle
        
        if character == "%" {
            currentNumberValue = currentNumberValue * 0.01
            arrayOfNumbers.append(currentNumberValue)
            equationString = equationString! + "\(currentNumberValue)"
        } else if character == "±" {
            currentNumberValue = currentNumberValue * -1
            arrayOfNumbers.append(currentNumberValue)
            equationString = equationString! + "\(currentNumberValue)"
        } else {
        }
    }
    
    
    
    //BINARY OPERATORS
    func operateBinary(button: UIButton) {
        
        evaluate()
        
        if let character = button.currentTitle {
            arrayOfOperations.append(character)
            println("operator appended: \(arrayOfOperations)")
            equationString = equationString! + character
            resultDisplay = "0"
            appending = false
            /*switch character {
                case "+", "-": evaluate()
                case "*", "/": sortArray(button)
                default: break
            }*/
        }
    }
    
    var orderOfOperations = ["*", "/", "+", "-"]
    
    func sortArray(button: UIButton) {
//         if arrayOfOperations.count >= 2 {
//
//              if ["*", "/"] are in front of ["+", "-"] {
//                  evaluate()
//              } else {
//                arrayOfOperations.sorted ({ $0.* > $1.+ })
//                evaluate()
//              }
//
        
    }
    
    func evaluate() {
        
        arrayOfNumbers.append(currentNumberValue)
        
        var num2: Double?
        
        if arrayOfNumbers.count >= 2 {
            num2 = arrayOfNumbers[arrayOfNumbers.count-2]
        }
        
        if !arrayOfOperations.isEmpty {
            currentNumberValue = doMath(arrayOfNumbers[arrayOfNumbers.count - 1], num2: num2, operation: arrayOfOperations.last!)
            arrayOfNumbers.removeAll(keepCapacity: true)
            arrayOfOperations.removeAll(keepCapacity: true)
            arrayOfNumbers.insert(currentNumberValue, atIndex: 0)
        }
        
        println("arrayOfNumbers: \(arrayOfNumbers)")
        println("arrayOfOperations: \(arrayOfOperations)")
        
    }
    
    
    func doMath(num1: Double, num2: Double?, operation: String) -> Double {
        
        var result: Double = 0.0
        let optionalNum2 = num2 ?? num1
        
        switch operation {
        case "+": result = num1 + optionalNum2
        case "-": result = optionalNum2 - num1
        case "*": result = num1 * optionalNum2
        case "/": result = optionalNum2 / num1
        default: break
        }
        return result
        
    }

}
