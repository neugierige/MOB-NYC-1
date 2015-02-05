//
//  ViewController.swift
//  Smile
//
//  Created by Rudd Taylor on 2/4/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let topMargin: CGFloat = 50
        let size: CGFloat = 15
        var leftEye = UIView(frame: CGRect(x: self.view.frame.size.width/4, y: topMargin, width: size, height: size))
        var rightEye = UIView(frame: CGRect(x: self.view.frame.size.width * 0.75, y: topMargin, width: size, height: size))
            
        leftEye.backgroundColor = UIColor.purpleColor()
        rightEye.backgroundColor = UIColor.orangeColor()
        
        leftEye.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin
        rightEye.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
        
        view.addSubview(leftEye)
        view.addSubview(rightEye)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

