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
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.25, constant: 1.0))
        view.addConstraint(NSLayoutConstraint(
            item: keySize, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 1.0, constant: 1.0))
        keySize.layer.borderWidth = 1
        
        
        //DEFINING CONTAINER FOR ALL KEYS
        var keypadContainer = UIView()
        self.view.addSubview(keypadContainer)
        keypadContainer.setTranslatesAutoresizingMaskIntoConstraints(false)
        keypadContainer.backgroundColor = UIColor.purpleColor()
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 5.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(
            item: keypadContainer, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        

        //DEFINING LABEL FOR DISPLAYING THE RESULT
        var displayLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - keypadContainer.frame.height))
        self.view.addSubview(displayLabel)
        displayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        displayLabel.backgroundColor = UIColor.blackColor()
        displayLabel.textColor = UIColor.whiteColor()
        displayLabel.text = "0"
        displayLabel.textAlignment = NSTextAlignment.Right
        view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0.0))
        view.addConstraint(NSLayoutConstraint(
            item: displayLabel,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Height,
            multiplier: 3/8,
            constant: 0.0))
        
        
        //CREATING THE KEYPAD BUTTONS - DIGITS
        var zero = UIButton()
        var one = UIButton()
        var two = UIButton()
        var three = UIButton()
        var four = UIButton()
        var five = UIButton()
        var six = UIButton()
        var seven = UIButton()
        var eight = UIButton()
        var nine = UIButton()
        var decimal = UIButton()
        
        for digitsAll in [zero, one, two, three, four, five, six, seven, eight, nine, decimal] {
            self.view.addSubview(digitsAll)
            digitsAll.setTranslatesAutoresizingMaskIntoConstraints(false)
            digitsAll.backgroundColor = UIColor.grayColor()
            digitsAll.layer.borderColor = UIColor.whiteColor().CGColor
            digitsAll.layer.borderWidth = 1
            digitsAll.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }

        for digitsExceptZero in [one, two, three, four, five, six, seven, eight, nine, decimal] {
            self.view.addConstraint(NSLayoutConstraint(
                item: digitsExceptZero,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: keySize,
                attribute: .Width,
                multiplier: 1.0,
                constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(
                item: digitsExceptZero,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: keySize,
                attribute: .Width,
                multiplier: 1.0,
                constant: 0.0))
//            var buttonLabels: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "."] ?? []
//            digit.titleLabel = buttonLabels
        }
        
        
        
        //ZERO - unique size
        self.view.addConstraint(NSLayoutConstraint(item: zero, attribute: .Height, relatedBy: .Equal, toItem: keySize, attribute: .Height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: zero, attribute: .Width, relatedBy: .Equal, toItem: keySize, attribute: .Width, multiplier: 2.0, constant: 0.0))
        zero.setTitle("0", forState: UIControlState.Normal)
        zero.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        //1st ROW OF BUTTONS
        for firstRow in [zero, decimal] {
            self.view.addConstraint(NSLayoutConstraint(item: firstRow, attribute: .Bottom, relatedBy: .Equal, toItem: keypadContainer, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        }
        
        //2nd ROW OF BUTTONS
        for secondRow in [one, two, three] {
            self.view.addConstraint(NSLayoutConstraint(item: secondRow, attribute: .Bottom, relatedBy: .Equal, toItem: zero, attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //3rd ROW OF BUTTONS
        for thirdRow in [four, five, six] {
            self.view.addConstraint(NSLayoutConstraint(item: thirdRow, attribute: .Bottom, relatedBy: .Equal, toItem: one, attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //4th ROW OF BUTTONS
        for fourthRow in [seven, eight, nine] {
            self.view.addConstraint(NSLayoutConstraint(item: fourthRow, attribute: .Bottom, relatedBy: .Equal, toItem: four, attribute: .Top, multiplier: 1.0, constant: 0.0))
        }
        
        //1st COLUMN OF BUTTONS
        for firstColumn in [zero, one, four, seven] {
            self.view.addConstraint(NSLayoutConstraint(item: firstColumn, attribute: .Left, relatedBy: .Equal, toItem: keypadContainer, attribute: .Left, multiplier: 1.0, constant: 0.0))
        }
        
        //2nd COLUMN OF BUTTONS
        for secondColumn in [two, five, eight] {
            self.view.addConstraint(NSLayoutConstraint(item: secondColumn, attribute: .Left, relatedBy: .Equal, toItem: one, attribute: .Right, multiplier: 1.0, constant: 0.0))
        }
        
        //3rd COLUMN OF BUTTONS
        for thirdColumn in [decimal, three, six, nine] {
            self.view.addConstraint(NSLayoutConstraint(item: thirdColumn, attribute: .Left, relatedBy: .Equal, toItem: zero, attribute: .Right, multiplier: 1.0, constant: 0.0))
        }
        
        
        //ONE
        one.setTitle("1", forState: UIControlState.Normal)

        //FOUR
        four.setTitle("4", forState: UIControlState.Normal)
        
        //SEVEN
        seven.setTitle("7", forState: UIControlState.Normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

