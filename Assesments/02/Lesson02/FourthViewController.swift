//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

/*
TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/

class FourthViewController: UIViewController {
       
    @IBOutlet var inputFib: UITextField!
        
    @IBOutlet var labelFib: UILabel!
        
    @IBAction func buttonCalculate(sender: AnyObject) {
        todoSeven()
    }
    
    class FibonacciAdder {
        var indexOfFibonacciNumber: Int = 0
        var inputNumber: Int = 0
        func fibonacciNumberAtIndex (inputNumber: Int) -> Int {
            var n1 = 0, n2 = 1, n3 = 1
            if inputNumber == 1 {
                indexOfFibonacciNumber = n1
            } else if inputNumber == 2 {
                indexOfFibonacciNumber = n2
            } else if inputNumber == 3 {
                indexOfFibonacciNumber = n3
            } else {
                for index in 4...inputNumber {
                    n1 = n2
                    n2 = n3
                    n3 = n1 + n2
                }
                indexOfFibonacciNumber = n3
            }
            return(indexOfFibonacciNumber)
        }
    }
    
    
    func todoSeven () {
        var randomVariable = FibonacciAdder()

//        randomVariable.inputNumber = inputFib.text.toInt()!
//        randomVariable.fibonacciNumberAtIndex(4)
        
        var currentNumber = inputFib.text.toInt() ?? 0
        
        labelFib.text = String(randomVariable.fibonacciNumberAtIndex(currentNumber))
        
        
// need to convert inputFib.text into an Int?
//        println(\(randomVariable.fibonacciNumberAtIndex(inputFib.text)))
    }
}





