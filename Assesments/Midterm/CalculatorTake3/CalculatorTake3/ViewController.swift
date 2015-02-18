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

    
    //ARRAYS for numbers and operators
    var arrayOfNumbers: [Double] = []
    var arrayOfOperations: [String] = []
    
    
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
        arrayOfNumbers.removeLast()

        if character == "%" {
            currentNumberValue = currentNumberValue * 0.01
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(arrayOfNumbers.last)"
        } else if character == "±" {
            
            
            currentNumberValue = currentNumberValue * -1
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(arrayOfNumbers.last)"
        } else {
        }
    }
    
    
    
    //BINARY OPERATORS
    @IBAction func operateBinary(sender: UIButton) {
        
        let character = sender.currentTitle!
        
        evaluate()
        
        // CHECK if more than 1 OPERATOR was pressed
        if arrayOfOperations.count < arrayOfNumbers.count {
            arrayOfOperations.append(character)
            equationDisplay.text = equationDisplay.text! + character
            appending = false
        } else if arrayOfOperations.count > arrayOfNumbers.count { // if count of OPERATORS > NUMBERS
            arrayOfOperations.removeLast()
            arrayOfOperations.append(character)
            equationDisplay.text = equationDisplay.text! + character
            appending = false
        }
        
//        switch character {
//            case "+", "-": evaluate()
//            case "*", "/": evaluateFirst()
//        default: break
//          }
        
    }

//    func evaluateFirst() {
//        
//        evaluate()
//        
//        if arrayOfNumbers.count > 2 {
//            arrayOfNumbers.removeAtIndex(arrayOfNumbers.count-1)
//            arrayOfNumbers.removeAtIndex(arrayOfNumbers.count-2)
//            
//        } else {
//            
//        }
//
//    }

    
    
    @IBAction func evaluate() {

        arrayOfNumbers.append(currentNumberValue)
        
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
            currentNumberValue = doMath(arrayOfNumbers[arrayOfNumbers.count - 1], num2: num2, operation: arrayOfOperations.last!)
            
            // updates ARRAY OF NUMBERS
            arrayOfNumbers.removeLast()
            arrayOfNumbers.removeLast()
                //arrayOfOperations.removeAll(keepCapacity: true)
            arrayOfNumbers.append(currentNumberValue)
                //arrayOfNumbers.replaceRange(0...1, with: [currentNumberValue])
            
            // updates ARRAY OF OPERATORS
            arrayOfOperations.removeLast()
        }
        
    }
    
    
    func doMath(num1: Double, num2: Double?, operation: String) -> Double {
        
        var result: Double = 0.0
        let optionalNum2 = num2 ?? num1
        
        
        // COMMENTS are attempts to implement PEMDAS handling
        switch operation {
            case "+": result = num1 + optionalNum2
            //evaluate(num1, num2: optionalNum2, operation: +)
            case "-": result = optionalNum2 - num1
            //evaluate(optionalNum2, num2: -num1, operation: +)
            case "*": result = num1 * optionalNum2
            //evaluateFirst(num1, num2: optionalNum2, operation: "*")
            case "/": result = optionalNum2 / num1
            //evaluateFirst(optionalNum2, num2: 1/num1, operation: "*")
            default: break
        }
        return result
        
    }

    
    
//    @IBAction func evaluateFirst(sender: UIButton) {
//        if let character = sender.currentTitle {
//            if let index = find(arrayOfOperations, character) {
//            let temporaryResult = doMath(arrayOfNumbers[index], num2: arrayOfNumbers[index+1], operation: character)
//            arrayOfNumbers.replaceRange([index]...[index+1], with:[temporaryResult])
//            arrayOfOperations.removeAtIndex(index: index)
//            }
//        }
//
//    }
    
//        let index = find(arrayOfOperations, "*")
//
////        var num1 = arrayOfNumbers[index]
////        var num2 = arrayOfNumbers[index+1]
//        
//        for mathOperator in arrayOfOperations {
//            
//            switch mathOperator {
//                case "*", "/": println("switch is working") //currentNumberValue = num1 * num2
//                case "+", "-": println("blah") //addSubtr(Double, Double)
//            default: break
//            }
//        }
//            
    
//            if mathOperator == "*" || mathOperator == "/" {
//                
//                // if NOT all items in arrayOfOperations are ["*" or "/"]
//                
//                if let index = find(arrayOfOperations, "*") {
//                    currentNumberValue = arrayOfNumbers[index] * arrayOfNumbers[index + 1]
//                } else {
//
//                }
//            }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

