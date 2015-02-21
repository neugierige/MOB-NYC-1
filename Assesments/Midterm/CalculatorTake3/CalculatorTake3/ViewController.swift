//
//  ViewController.swift
//  CalculatorTake3
//
//  Created by Luyuan Xing on 2/14/15.
//  Copyright (c) 2015 GA. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    
    //LABELS set up
    @IBOutlet var resultDisplay: UILabel!
    @IBOutlet var equationDisplay: UILabel! //not working right now...
    
    
    //BUTTONS set up
    @IBOutlet var clearButton: UIButton!
    
    
    //get NUMBER from label.text
    var currentNumberValue: Double {
        get {
            return NSNumberFormatter().numberFromString(resultDisplay.text!)!.doubleValue
        }
        set {
            resultDisplay.text = "\(newValue)"
            appending = false
        }
    }
    
    
    //ARRAYS for numbers and operators
    var arrayOfNumbers: [Double] = []
    var arrayOfOperations: [String] = []
    
    
    //BOOL for APPENDING
    var appending: Bool = false
    
    
    //WHEN ANY BUTTON IS PRESSED --> I DON'T KNOW HOW TO MAKE THIS WORK :-(
    @IBAction func buttonPressed(sender: UIButton) {
        
        let character = sender.currentTitle!
//        switch character {
//        case "1", "2", "3", "4", "5", "6", "7", "8", "9", ".": appendDigits()
//        case "/", "*", "-", "+":
//            operateBinary()
//        case "AC": [equationDisplay.text = "0", resultDisplay.text = "0"]
//        case "±", "%": operateUnary()
//        default: break
//        }
    }
    
    
    //APPENDING DIGITS
    @IBAction func appendDigits(sender: UIButton) {
        
        let character = sender.currentTitle
        
        if appending {
            
            //DECIMAL POINT restrictions
            if character == "." {
                if let textString = resultDisplay.text {
                    if textString.rangeOfString(".") != nil {
                        println("can't add more decimals")
                    } else {
                        resultDisplay.text = textString + character!
                        equationDisplay.text = equationDisplay.text! + character!
                    }
                }
            } else { //if character != "."
                println("no decimals or correct decimals")
                resultDisplay.text = resultDisplay.text! + character!
                equationDisplay.text = equationDisplay.text! + character!
            }
            
        } else {
            if character != "0" {
                equationDisplay.text = equationDisplay.text! + character!
                resultDisplay.text = character!
                appending = true
                clearButton.setTitle("C", forState: UIControlState.Normal)

//                if arrayOfOperations.last == "*" || arrayOfOperations.last == "/" {
//                    var product: Double = 0.0
//                    product = doMath(arrayOfNumbers.last!, num2: currentNumberValue, operation: character!)
//                    //evaluate()
//                } else {
//                }
                
            }
        }
    }
    
    
    //CLEAR button
    @IBAction func clearPressed() {
        
        if clearButton.currentTitle == "C" {
            resultDisplay.text = "0"
            clearButton.setTitle("AC", forState: UIControlState.Normal)
        } else if clearButton.currentTitle == "AC" {
            equationDisplay.text = ""
            resultDisplay.text = "0"
            arrayOfNumbers = []
            arrayOfOperations = []
            println("all cleared")
        }
    }
    
    
    //UNARY OPERATORS
    @IBAction func operateUnary(sender: UIButton) {
        let character = sender.currentTitle

        if character == "%" {
            currentNumberValue = currentNumberValue * 0.01
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(arrayOfNumbers.last)"
        } else if character == "±" {
            currentNumberValue = currentNumberValue * -1
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(arrayOfNumbers.last)"
        }
        
        arrayOfNumbers.removeAtIndex(arrayOfNumbers.count-1)
        
    }
    
    
    
    //BINARY OPERATORS
    @IBAction func operateBinary(sender: UIButton) {
        
        //STOP appending
        appending = false
        
        //UNWRAPPING optional "character"
        if let character = sender.currentTitle {
            
            //APPEND current operator
            arrayOfOperations.append(character)
            println("arrayOfOperations = \(arrayOfOperations)")
            equationDisplay.text = equationDisplay.text! + character
            
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
                var equationArray = Array(arrayLiteral: equationDisplay.text)
                equationArray.removeAtIndex(equationArray.count-1)
                
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

    
    @IBAction func evaluate(sender: UIButton) {
        
        let character = sender.currentTitle
        
        if character == "=" {
            println("current number = \(currentNumberValue)")
            arrayOfNumbers.append(currentNumberValue)
            evaluate(sender)
        } else {
        
            println("arrayOfNumbers: \(arrayOfNumbers)")
            println("arrayOfOperations: \(arrayOfOperations)")
            println("equation: \(equationDisplay.text)")
        

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
                resultDisplay.text == resultDisplay.text
            }
        
        }
    }
    
    
    func doMath(num1: Double, num2: Double?, operation: String) -> Double {
        
        var result: Double = 0.0
        let optionalNum2 = num2 ?? num1
        
        switch operation {
            case "+": result = num1 + optionalNum2
            //doMath(num1, num2: optionalNum2, operation: +)
            case "-": result = optionalNum2 - num1
            //doMath(optionalNum2, num2: -num1, operation: +)
            case "*": result = num1 * optionalNum2
            //doMath(num1, num2: optionalNum2, operation: "*")
            case "/": result = optionalNum2 / num1
            //doMath(optionalNum2, num2: 1/num1, operation: "*")
            default: break
        }
        return result
        
    }




}

