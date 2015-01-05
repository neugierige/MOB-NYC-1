//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBOutlet var inputNumber: UITextField!
    
    @IBOutlet var labelPrint: UILabel!
    
    @IBAction func buttonCalculate(sender: AnyObject) {
        todoSix()
    }

    
//    func todoSix() {
//        var varInput = inputNumber.text.toInt()
//        
//        if varInput % 2 == 0 {
//            labelPrint.text = ("Even")
//        } else {
//            labelPrint.text = ("Odd")
//        }
//    }
    
    func todoSix() {
        let varInput = inputNumber.text.toInt()
        
        if let blah = varInput {
            if blah % 2 == 0 {
                labelPrint.text = ("Even")
            } else {
                labelPrint.text = ("Odd")
            }
        }
    }
}

//func todoFive() {
//    let varInputNum = inputNums.text.toInt()
//    
//    if let varStoreNum = varInputNum {
//        sum = varStoreNum + sum
//    }
//    sumDisplay.text = "\(sum)"
//}

