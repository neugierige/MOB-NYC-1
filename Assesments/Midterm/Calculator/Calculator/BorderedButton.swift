//
//  BorderedButton.swift
//  Calculator
//
//  Created by Luyuan Xing on 2/11/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {

    override init() {
        super.init()
        let innerView = UIView()
        self.addSubview(innerView)
        innerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let borderSize: CGFloat = 1.0
        innerView.layer.borderColor = UIColor(red: 130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 1.0).CGColor
        innerView.layer.borderWidth = borderSize
        
        self.addConstraint(NSLayoutConstraint(item: innerView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: innerView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: innerView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: innerView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


//    if let buttonPressed = sender.currentTitle {
//        switch buttonPressed {
//        case "±":
//            currentNumberValue = arrayOfNumbers.removeLast() * -1
//        case "%":
//            currentNumberValue = arrayOfNumbers.removeLast() * 0.01
//        case "÷":
//            performCalculation({$1 / $0})
//        case "×":
//            performCalculation({$0 * $1})
//        case "-":
//            performCalculation({$1 - $0})
//        case "+":
//            performCalculation({$0 + $1})
//        default: break
//        }