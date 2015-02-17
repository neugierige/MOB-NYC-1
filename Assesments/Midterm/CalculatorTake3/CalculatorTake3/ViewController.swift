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
    @IBOutlet var equationDisplay: UILabel!
    @IBOutlet var resultDisplay: UILabel!
//    let equation = Array(equationDisplay.text!) //why doesn't this work??

    
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
    
    //WHEN ANY BUTTON (EXCEPT = or AC) IS PRESSED
    @IBAction func buttonPressed(sender: UIButton) {
        
        let character = sender.currentTitle!
        
        // I don't know how to make this work
//        switch character {
//        case "1", "2", "3", "4", "5", "6", "7", "8", "9", ".": appendDigits()
//        case "/", "*", "-", "+":
//            operateBinary()
////        case "AC": [equationDisplay.text = "0", resultDisplay.text = "0"]
//        case "±", "%": operateUnary()
//        default: break
//        }
    }

    var arrayOfNumbers: [Double] = []
    var arrayOfOperations: [String] = []
    
    //APPENDING DIGITS
    @IBAction func appendDigits(sender: UIButton) {
        
        let character = sender.currentTitle
        
        if appending {
            
            if character == "." {
                if let textString = resultDisplay.text {
                    if textString.rangeOfString(".") != nil {
                        println("can't add more decimals")
                    } else {
                        resultDisplay.text = textString + character!
                        equationDisplay.text = equationDisplay.text! + character!
                    }
                }
            } else {
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
            }
        }
    }
    
    
    //CLEAR button
    @IBAction func clearPressed() {
        if arrayOfNumbers.isEmpty == false { //if the array of numbers is NOT empty
            resultDisplay.text = "0"
            clearButton.setTitle("AC", forState: UIControlState.Normal)
        } else {
        }
        
        if clearButton.currentTitle == "AC" {
            equationDisplay.text = ""
            resultDisplay.text = "0"
            arrayOfNumbers = []
            arrayOfOperations = []
        }
    }
    
    
    //UNARY OPERATORS
    @IBAction func operateUnary(sender: UIButton) {
        let character = sender.currentTitle
        arrayOfNumbers.removeLast()

        if character == "%" {
            currentNumberValue = currentNumberValue * 0.01
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(currentNumberValue)"
        } else if character == "±" {
            currentNumberValue = currentNumberValue * -1
            arrayOfNumbers.append(currentNumberValue)
            equationDisplay.text = equationDisplay.text! + "\(currentNumberValue)"
        } else {
        }
    }
    
    
    
    //BINARY OPERATORS
    @IBAction func operateBinary(sender: UIButton) {
        
        evaluate()
        
        let character = sender.currentTitle!
        arrayOfOperations.append(character)
        println("operator appended: \(arrayOfOperations)")
        
        equationDisplay.text = equationDisplay.text! + character
        resultDisplay.text = "0"
        appending = false
        
        //        switch character {
        //            case "+", "-": evaluate()
        //            case "*", "/": evaluate() // evaluateFirst(sender)
        //        default: break
        //          }
        
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
    
    
    func evaluate() {

        arrayOfNumbers.append(currentNumberValue)
        
        var num2: Double?
        
        if arrayOfNumbers.count >= 2 {
            num2 = arrayOfNumbers[arrayOfNumbers.count-2]
        }
        
        if arrayOfOperations.isEmpty == false {
            currentNumberValue = doMath(arrayOfNumbers[arrayOfNumbers.count - 1], num2: num2, operation: arrayOfOperations.last!)
            arrayOfNumbers.removeAll(keepCapacity: true)
            arrayOfOperations.removeAll(keepCapacity: true)
            arrayOfNumbers.append(currentNumberValue)
            //arrayOfNumbers.replaceRange(0...1, with: [currentNumberValue])
            //arrayOfOperations.removeLast()
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
        

//        if character == "+" {
//            currentNumberValue = arrayOfNumbers.removeLast() + arrayOfNumbers.removeLast()
//        }
//        if character == "-" {
//            currentNumberValue = { $1 - $0 }
//        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

