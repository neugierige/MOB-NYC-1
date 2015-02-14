//
//  ViewController.swift
//  Calculator
//
//  Created by Luyuan Xing on 2/9/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //DEFINE SIZE OF A SINGLE KEY UNIT
        var keySize = UIView()
        view.addSubview(keySize)
        keySize.setTranslatesAutoresizingMaskIntoConstraints(false)
        let borderWidth: CGFloat = 1.0
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.25, constant: -borderWidth))
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 1.0, constant: -borderWidth))
        keySize.layer.borderWidth = borderWidth
        
        
        //DEFINING CONTAINER FOR ALL KEYS
        var keypadContainer = UIView()
        self.view.addSubview(keypadContainer)
        keypadContainer.setTranslatesAutoresizingMaskIntoConstraints(false)
        keypadContainer.backgroundColor = UIColor.whiteColor()
        keypadContainer.layer.borderWidth = 1.0
        keypadContainer.layer.borderColor = UIColor.whiteColor().CGColor
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 1.5))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -1.5))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 5.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -1.5))
        

        //DEFINING LABEL FOR DISPLAYING THE RESULT
        var displayLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width,
            height: 205))
        println(keypadContainer.frame.height)
        self.view.addSubview(displayLabel)
        displayLabel.backgroundColor = UIColor.blackColor()
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.text = "0"
        displayLabel.textAlignment = NSTextAlignment.Right
        
        var buttonLabels: [String] = [
            "AC", "±", "%", "÷",  // 0,  1,   2, 3
            "7", "8", "9", "×",   // 4,  5,   6, 7
            "4", "5", "6", "−",   // 8,  9,  10, 11
            "1", "2", "3", "+",   // 12, 13, 14, 15
            "0", ".", "=",] ?? [] // 16,     17, 18
        
        var arrayOfButtons:[UIButton] = []
        
        for (index, label) in enumerate(buttonLabels) {
            var buttonsAll = BorderedButton()
            self.view.addSubview(buttonsAll)
            buttonsAll.backgroundColor = UIColor.grayColor()
            buttonsAll.setTranslatesAutoresizingMaskIntoConstraints(false)
            buttonsAll.layer.borderColor = UIColor.whiteColor().CGColor
            buttonsAll.layer.borderWidth = borderWidth
            buttonsAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            buttonsAll.setTitle(buttonLabels[index], forState: UIControlState.Normal)
            arrayOfButtons.append(buttonsAll)
        }
        
        for (index, buttonsAll) in enumerate(arrayOfButtons) {
            if index != 16 {
                    self.view.addConstraint(NSLayoutConstraint(
                        item: buttonsAll,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: keySize,
                        attribute: .Width,
                        multiplier: 1.0,
                        constant: 0.0))
                    self.view.addConstraint(NSLayoutConstraint(
                        item: buttonsAll,
                        attribute: .Height,
                        relatedBy: .Equal,
                        toItem: keySize,
                        attribute: .Width,
                        multiplier: 1.0,
                        constant: 0.0))
            }
        }
        
        for (index, buttonsAll) in enumerate(arrayOfButtons) {
            if index != 0 {
                if index != 1 {
                    if index != 2 {
                        if index != 3 {
                            if index != 7 {
                                if index != 11 {
                                    buttonsAll.addTarget(self, action: "appendDigit", forControlEvents: UIControlEvents.TouchUpInside)
                }
            }
        }
        
        func appendDigit() {

        }
        
        //ZERO - unique size
        self.view.addConstraint(NSLayoutConstraint(item: arrayOfButtons[16], attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: arrayOfButtons[16], attribute: .Width, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 2.0, constant: 0.0))
        
        //1st ROW OF BUTTONS
        for firstRow in [arrayOfButtons[16], arrayOfButtons[17], arrayOfButtons[18]] {
            self.view.addConstraint(NSLayoutConstraint(item: firstRow, attribute: .Bottom, relatedBy: .Equal, toItem: keypadContainer, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        }
        
        //2nd ROW OF BUTTONS
        for secondRow in [arrayOfButtons[12], arrayOfButtons[13], arrayOfButtons[14], arrayOfButtons[15]] {
            self.view.addConstraint(NSLayoutConstraint(item: secondRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[16], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //3rd ROW OF BUTTON
        for thirdRow in [arrayOfButtons[8], arrayOfButtons[9], arrayOfButtons[10], arrayOfButtons[11]] {
            self.view.addConstraint(NSLayoutConstraint(item: thirdRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[12], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //4th ROW OF BUTTONS
        for fourthRow in [arrayOfButtons[4], arrayOfButtons[5], arrayOfButtons[6], arrayOfButtons[7]] {
            self.view.addConstraint(NSLayoutConstraint(item: fourthRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[8], attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //5th ROW OF BUTTONS
        for fifthRow in [arrayOfButtons[0], arrayOfButtons[1], arrayOfButtons[2], arrayOfButtons[3]] {
            self.view.addConstraint(NSLayoutConstraint(item: fifthRow, attribute: .Bottom, relatedBy: .Equal, toItem: arrayOfButtons[4], attribute: .Top, multiplier: 1.0, constant: 0.0))
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
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

