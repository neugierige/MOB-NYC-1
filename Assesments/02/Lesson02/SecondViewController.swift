//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.

    @IBOutlet var inputNums: UITextField!
    
    @IBOutlet var sumDisplay: UILabel!
    
    @IBAction func addButton(sender: AnyObject) {
        todoFive()
    }
    
    var sum = 0
    
    func todoFive() {
        let varInputNum = inputNums.text.toInt()
        
        if let varStoreNum = varInputNum {
            sum = varStoreNum + sum
        }
        sumDisplay.text = "\(sum)"
    }
    
}

