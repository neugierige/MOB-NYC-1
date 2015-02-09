//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        if let navBarFrame: CGRect = self.navigationController?.navigationBar.frame {
            var navBarHeight = navBarFrame.maxY
            var redBox = UIView(frame: CGRect(x: 0, y: navBarHeight, width: self.exerciseView.frame.size.width, height: 10))
            redBox.backgroundColor = UIColor.redColor()
            redBox.layer.borderWidth = 2
            redBox.layer.borderColor = UIColor.blackColor().CGColor
            exerciseView.addSubview(redBox)
        }
        
        
        var blackBox = UIView(frame: CGRect(x: 0, y: self.exerciseView.frame.size.height - 54, width: self.exerciseView.frame.size.width, height: 10))
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderWidth = 2
        blackBox.layer.borderColor = UIColor.redColor().CGColor
        exerciseView.addSubview(blackBox)
        
//        var toolBarFrame = UIToolbar.frameForAlignmentRect(toolbar)
//        var blackBox = UIView(frame: CGRect(x: 0, y: self.exerciseView.frame.size.height - 54, width: self.exerciseView.frame.size.width, height: 10))

        
        // DID NOT WORK
//        var redBox = UIView(frame: CGRect(x: 0, y: self.navigationController?.navigationBar.frame.maxY, width: self.exerciseView.frame.width, height: 10))
//        var redBox = UIView(frame: CGRect(x: 0, y: navBarHeight, width: self.exerciseView.frame.width, height: 10))
        
//        var navBarFrame: CGRect? = self.navigationController?.navigationBar.frame

        
//        if let self.navigationController.navigationBar.frame.height = navBarHeight {
//            redBox.frame.minY = navBarHeight
//        }
        
        //        var navBarHeight: CGFloat = 0.0
        //        var redBox = UIView(frame: CGRect(x: 0, y: navBarHeight, width: self.exerciseView.frame.size.width, height: 100))
        //        redBox.backgroundColor = UIColor.redColor()
        //        redBox.layer.borderWidth = 10
        //        redBox.layer.borderColor = UIColor.blackColor().CGColor
        //        exerciseView.addSubview(redBox)
        //        self.exerciseView.layoutIfNeeded()
        
        //        if let navBarFrame: CGRect = self.navigationController?.navigationBar.frame {
        //            var navBarHeight = navBarFrame.maxY
        //        }
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
