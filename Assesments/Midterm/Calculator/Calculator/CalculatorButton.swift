
//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Luyuan Xing on 2/11/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class CalculatorButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
    }
    
//    override func awakeFromNib() {
//        <#code#>
//    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
