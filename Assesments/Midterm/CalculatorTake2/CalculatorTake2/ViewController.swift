//
//  ViewController.swift
//  CalculatorTake2
//
//  Created by Luyuan Xing on 2/13/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var equationDisplay: UILabel!
    @IBOutlet var resultDisplay: UILabel!
    
    var currentNumberValue: Double {
        get {
            return NSNumberFormatter().numberFromString(resultDisplay.text!)!.doubleValue
        }
        set {
            resultDisplay.text = "\(newValue)"
            appending = false
        }
    }
    
    var appending: Bool = false
    
    var aBrain = Brains()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digitEntered = sender.currentTitle!
        if appending {
            resultDisplay.text = resultDisplay.text! + digitEntered
        } else {
            resultDisplay.text = digitEntered
            appending = true
        }
    }

    var arrayOfNumbers: [Double] = []
    
       @IBAction func calculate(sender: UIButton) {
        if appending {
            enter()
        }

//        appending = false
//        println("value of last number entered = \(currentNumberValue)")
//        arrayOfNumbers.append(currentNumberValue) // --> now done via "pushNumbers" in "Brains" class
//        println("\(arrayOfNumbers)")

        if let operationSymbol = sender.currentTitle {
//            switch operationSymbol {
//            case "±":
//                currentNumberValue = arrayOfNumbers.removeLast() * -1
//            case "%":
//                currentNumberValue = arrayOfNumbers.removeLast() * 0.01
//            case "÷":
//                performCalculation({$1 / $0})
//            case "×":
//                performCalculation({$0 * $1})
//            case "-":
//                performCalculation({$1 - $0})
//            case "+":
//                performCalculation({$0 + $1})
//            default: break
//            }
            
            if let result = aBrain.performCalculations(operationSymbol) {
                currentNumberValue = result
            } else {
                currentNumberValue = 0 //should really be "nil"
            }
            
        }
    }
    
       @IBAction func enter() {
        appending = false
        if let result = aBrain.pushNumbers(currentNumberValue) {
            currentNumberValue = result
        } else {
            currentNumberValue = 0 //could be "nil" or return error message
        }
    }
    
    func performCalculation(operation: (Double, Double) -> Double) {
        if arrayOfNumbers.count >= 2 {
            currentNumberValue = operation(arrayOfNumbers.removeLast(), arrayOfNumbers.removeLast())
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

