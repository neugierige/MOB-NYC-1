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
    var equationString: String = ""
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
    func appendDigits(sender: UIButton) {
        
        if let character = sender.currentTitle {
        
            if appending {
                
                println("I'm appending!")
                
                //DECIMALS
                if character == "." {
                    if let textString = resultDisplay {
                        if textString.rangeOfString(".") != nil {
                            println("can't add more decimals")
                        } else {
                            resultDisplay = textString + character
                            equationString = equationString + character
                        }
                    }
                } else {
                    resultDisplay = resultDisplay! + character
                    equationString = equationString + character
                    println("resultDisplay: \(resultDisplay)")
                }
                
            } else {
                if character != "0" {
                    equationString = equationString + character
                    resultDisplay = character
                    appending = true
                    

                }
            }
        }
    }
    
    
    
    //CLEAR button
    func clearPressed(sender: UIButton) {
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
    func operateUnary(sender: UIButton) {
        let character = sender.currentTitle
        
        if character == "%" {
            currentNumberValue = currentNumberValue * 0.01
            arrayOfNumbers.append(currentNumberValue)
            equationString = equationString + "\(currentNumberValue)"
        } else if character == "±" {
            currentNumberValue = currentNumberValue * -1
            arrayOfNumbers.append(currentNumberValue)
            equationString = equationString + "\(currentNumberValue)"
        } else {
        }
    }
    
    
    
    //BINARY OPERATORS
    func operateBinary(sender: UIButton) {

        //STOP appending
        appending = false
        
        //UNWRAPPING optional "character"
        if let character = sender.currentTitle {
            
            //APPEND current operator
            arrayOfOperations.append(character)
            println("arrayOfOperations = \(arrayOfOperations)")
            equationString = equationString + character
            
            //APPEND current number
            arrayOfNumbers.append(currentNumberValue)
            println("arrayOfNumbers = \(arrayOfNumbers)")
            
            //(1A) CHECK if any extraneous operators
            if arrayOfOperations.count <= arrayOfNumbers.count {
                
                //(2A) CHECK if there is only 1 number
                if arrayOfNumbers.count < 2 {
                    //if yes, do nothing
                    
                    //(2B) CHECK if there are 2 numbers to operate on
                } else if arrayOfNumbers.count == 2 {
                    
                    //(3A) CHECK if character is * OR /
                    if character == "*" || character == "/" {
                        var previousOperator = arrayOfOperations[arrayOfOperations.count-1]
                        
                        //(4A) CHECK if previous operator is NOT * OR / -> need PEMDAS
                        if previousOperator != character {
                            processPEMDAS(sender) // !!!!!!
                            //(4B) regular evaluate
                        } else if previousOperator == character {
                            evaluate(sender) // !!!!!!!
                        }
                        //(3B) if not, regular evaluate
                    } else {
                        evaluate(sender) // !!!!!!!
                    }
                }
                
                //(1B) if EXTRA operators,
            } else if arrayOfOperations.count > arrayOfNumbers.count {
                
                //1st REMOVE any extraneous operators
                arrayOfOperations.removeAtIndex(arrayOfOperations.count-1)
                    //var equationArray = Array(arrayLiteral: equationString)
                    //equationArray.removeAtIndex(equationArray.count-1)
                
                //THEN regular process
                operateBinary(sender)
            }
        }
        
    }
    
    func processPEMDAS(sender: UIButton) {
        
        if let character = sender.currentTitle {
            
            var product = 0.0
            var previousOperator = arrayOfOperations[arrayOfOperations.count-1]
            
            product = doMath(arrayOfNumbers.removeLast(), num2: arrayOfNumbers.removeLast(), operation: character)
            arrayOfNumbers.append(product)
            arrayOfOperations.removeAtIndex(arrayOfOperations.count-1)
            evaluate(sender)
        }
    }
    
    func evaluate(sender: UIButton) {
        
        let character = sender.currentTitle
        
        if character == "=" {
            println("current number = \(currentNumberValue)")
            arrayOfNumbers.append(currentNumberValue)
            evaluate(sender)
        } else {
            
            println("arrayOfNumbers: \(arrayOfNumbers)")
            println("arrayOfOperations: \(arrayOfOperations)")
            println("equation: \(equationString)")
            
            
            // 2nd number is OPTIONAL
            var num2: Double?
            if arrayOfNumbers.count >= 2 {
                num2 = arrayOfNumbers[arrayOfNumbers.count-2]
            }
            
            if arrayOfOperations.isEmpty == false {
                
                // CALLS doMath function
                currentNumberValue = doMath(arrayOfNumbers[arrayOfNumbers.count - 1], num2: num2, operation: arrayOfOperations[arrayOfOperations.count - 1])
                
                // updates ARRAY OF NUMBERS
                arrayOfNumbers.removeLast()
                if arrayOfNumbers.count >= 2{
                    arrayOfNumbers.removeLast()
                }
                arrayOfNumbers.append(currentNumberValue)
                //arrayOfNumbers.replaceRange(0...1, with: [currentNumberValue])
                
                // updates ARRAY OF OPERATORS
                arrayOfOperations.removeLast()
                
            } else {
                resultDisplay == resultDisplay
            }
            
        }
        
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
