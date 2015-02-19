//
//  ViewController.swift
//  Calculator
//
//  Created by Luyuan Xing on 2/9/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calculate = CalculatorClass()
    
    var clearButton = UIButton()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
        // DEFINE SIZE OF A SINGLE KEY UNIT
        
        var keySize = UIView()
        view.addSubview(keySize)
        keySize.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.25, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 1.0, constant: 0.0))
        
        
        // DEFINING CONTAINER FOR ALL KEYS
        
        var keypadContainer = UIView()
        self.view.addSubview(keypadContainer)
        keypadContainer.setTranslatesAutoresizingMaskIntoConstraints(false)
        keypadContainer.layer.borderWidth = 2.0
        keypadContainer.layer.borderColor = UIColor.blackColor().CGColor
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Width, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 4.0, constant: 2.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Height, multiplier: 5.0, constant: 2.0))
        
        
        // DEFINING LABEL FOR DISPLAYING THE RESULT
        
        var displayLabel = UILabel()
        self.view.addSubview(displayLabel)
        displayLabel.text = calculate.resultDisplay
        displayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        displayLabel.backgroundColor = UIColor.blackColor()
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.textAlignment = NSTextAlignment.Right
        
        ////////////
        //        //
        //  STOP  //
        //        //
        ////////////
        //how to make the text alignment offset (from the right edge) by a specific amount? i.e. 5.0
        
        displayLabel.font = displayLabel.font.fontWithSize(30)
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: displayLabel, attribute: .Bottom, relatedBy: .Equal, toItem: keypadContainer, attribute: .Top, multiplier: 1.0, constant: 0.0))
        
        var equationLabel = UILabel()
        self.view.addSubview(equationLabel)
        equationLabel.text = calculate.equationString
        //layout not set up yet
        
        
        //SET UP FOR BUTTONS
        
        var buttonLabels: [String] = [
            "AC", "±", "%", "÷",  // 0,  1,   2, 3
            "7", "8", "9", "×",   // 4,  5,   6, 7
            "4", "5", "6", "−",   // 8,  9,  10, 11
            "1", "2", "3", "+",   // 12, 13, 14, 15
            "0", ".", "="]        // 16,     17, 18
        
        var arrayOfButtons:[BorderedButton] = []
        
        for (index, label) in enumerate(buttonLabels) {
            var buttonsAll = BorderedButton()
            self.view.addSubview(buttonsAll)
            buttonsAll.setTitle(buttonLabels[index], forState: UIControlState.Normal)
            arrayOfButtons.append(buttonsAll)
            buttonsAll.setTranslatesAutoresizingMaskIntoConstraints(false)
            buttonsAll.backgroundColor = UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0)
            buttonsAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            buttonsAll.userInteractionEnabled = true
            buttonsAll.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            
            ///////////
            //       //
            //  STOP //
            //       //
            ///////////
            
            //  addTarget is NOT WORKING. WHY?????
        }
        
        clearButton = arrayOfButtons[0]
        
        for (index, buttonsAll) in enumerate(arrayOfButtons) {
            if index != 16 {
                self.view.addConstraint(NSLayoutConstraint(
                    item: buttonsAll, attribute: .Width, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 1.0, constant: 0.0))
                self.view.addConstraint(NSLayoutConstraint(
                    item: buttonsAll, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 1.0, constant: 0.0))
            }
        }
        
        
        // AUTOLAYOUT for ALL KEYS
        
        // ZERO - unique size
        self.view.addConstraint(NSLayoutConstraint(item: arrayOfButtons[16], attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: arrayOfButtons[16], attribute: .Width, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 2.0, constant: 0.0))
        
        //1st ROW OF BUTTONS
        for firstRow in arrayOfButtons[16...18] {
            self.view.addConstraint(NSLayoutConstraint(item: firstRow, attribute: .Bottom, relatedBy: .Equal, toItem: keypadContainer, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        }
        
        //2nd ROW OF BUTTONS
        for secondRow in arrayOfButtons[12...15] {
            self.view.addConstraint(NSLayoutConstraint(item: secondRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[16], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //3rd ROW OF BUTTON
        for thirdRow in arrayOfButtons[8...11] {
            self.view.addConstraint(NSLayoutConstraint(item: thirdRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[12], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //4th ROW OF BUTTONS
        for fourthRow in arrayOfButtons[4...7] {
            self.view.addConstraint(NSLayoutConstraint(item: fourthRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[8], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //5th ROW OF BUTTONS
        for fifthRow in arrayOfButtons[0...3] {
            self.view.addConstraint(NSLayoutConstraint(item: fifthRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[4], attribute: .Top, multiplier: 1.0, constant: 0.0))
            fifthRow.backgroundColor = UIColor(red: 160/255.0, green: 160/255.0, blue: 160/255.0, alpha: 1.0)
        }
        
        //1st COLUMN OF BUTTONS
        for firstColumn in [arrayOfButtons[0], arrayOfButtons[4], arrayOfButtons[8], arrayOfButtons[12], arrayOfButtons[16]] {
            self.view.addConstraint(NSLayoutConstraint(item: firstColumn, attribute: .Left, relatedBy: .Equal, toItem: keypadContainer, attribute: .Left, multiplier: 1.0, constant: 0.0))
        }
        
        //2nd COLUMN OF BUTTONS
        for secondColumn in [arrayOfButtons[1], arrayOfButtons[5], arrayOfButtons[9], arrayOfButtons[13]] {
            self.view.addConstraint(NSLayoutConstraint(item: secondColumn, attribute: .Left, relatedBy: .Equal, toItem: arrayOfButtons[12], attribute: .Right, multiplier: 1.0, constant: 0.0))
        }
        
        
        //3rd COLUMN OF BUTTONS
        for thirdColumn in [arrayOfButtons[2], arrayOfButtons[6], arrayOfButtons[10], arrayOfButtons[14], arrayOfButtons[17]] {
            self.view.addConstraint(NSLayoutConstraint(item: thirdColumn, attribute: .Left, relatedBy: .Equal, toItem: arrayOfButtons[16], attribute: .Right, multiplier: 1.0, constant: 0.0))
        }

        
        //4th COLUMN OF BUTTONS
        for fourthColumn in [arrayOfButtons[3], arrayOfButtons[7], arrayOfButtons[11], arrayOfButtons[15], arrayOfButtons[18]] {
            self.view.addConstraint(NSLayoutConstraint(item: fourthColumn, attribute: .Left, relatedBy: .Equal, toItem: arrayOfButtons[17], attribute: .Right, multiplier: 1.0, constant: 0.0))
            fourthColumn.backgroundColor = UIColor(red: 250/255.0, green: 138/255.0, blue: 52/255.0, alpha: 1.0)
        }
        
    }
    
    
    // change LABEL on CLEAR BUTTON
    func changeClear() {
        clearButton.currentTitle == "C"
    }
    

    // "BUTTON PRESSED"
    func buttonPressed(button: UIButton) {
        println("button pressed")
        if let buttonTitle = button.currentTitle {
            switch buttonTitle {
            case "AC": calculate.clearPressed(button)
            case "=": calculate.evaluate()
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "÷", "×", "−", "+":
                calculate.appendDigits(button)
            case "±", "%": calculate.operateUnary(button)
            default: break
            }
        }
    }
    
}