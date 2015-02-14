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
    
    var appending: Bool = false
    
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
    
    var currentNumberValue: Double {
        get {
            return NSNumberFormatter().numberFromString(resultDisplay.text!)!.doubleValue
        }
        set {
            resultDisplay.text = "\(newValue)"
            appending = false
        }
    }

    @IBAction func calculate(sender: UIButton) {

        appending = false
        println("value of last number entered = \(currentNumberValue)")
        arrayOfNumbers.append(currentNumberValue)
        println("\(arrayOfNumbers)")
        
        let operationSymbol = sender.currentTitle!
            switch operationSymbol {
            case "±":
                currentNumberValue = arrayOfNumbers.removeLast() * -1
            case "%":
                currentNumberValue = arrayOfNumbers.removeLast() * 0.01
            case "÷":
                performCalculation({$1 / $0})
            case "×":
                performCalculation({$0 * $1})
            case "-":
                performCalculation({$1 - $0})
            case "+":
                performCalculation({$0 + $1})
            default: break
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

