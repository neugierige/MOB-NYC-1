//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    
    var blueBox1 = UIView()
    var blueBox2 = UIView()
    var blueBox3 = UIView()
    var blueBox4 = UIView()
    var size: CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
            
        blueBox1 = UIView(frame: CGRect(x: self.exerciseView.frame.minX, y: navBarHeight, width: size, height: size))
        blueBox1.backgroundColor = UIColor.redColor()
        exerciseView.addSubview(blueBox1)
        blueBox1.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | .FlexibleTopMargin

            
        blueBox2 = UIView(frame: CGRect(x: self.exerciseView.frame.maxX-size, y: navBarHeight, width: size, height: size))
        blueBox2.backgroundColor = UIColor.blueColor()
        exerciseView.addSubview(blueBox2)
        blueBox2.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | .FlexibleTopMargin | .FlexibleBottomMargin
        
        
        blueBox3 = UIView(frame: CGRect(x: 0, y: self.exerciseView.frame.maxY-44-size, width: size, height: size))
        blueBox3.backgroundColor = UIColor.purpleColor()
        exerciseView.addSubview(blueBox3)
        blueBox3.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | .FlexibleTopMargin
        
        
        blueBox4 = UIView(frame: CGRect(x: self.exerciseView.frame.maxX-size, y: self.exerciseView.frame.maxY-44-size, width: size, height: size))
        blueBox4.backgroundColor = UIColor.greenColor()
        exerciseView.addSubview(blueBox4)
        blueBox4.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | .FlexibleTopMargin
        
        self.exerciseView.layoutIfNeeded()
        
    }
    
//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        let landscapeMode = size.width > size.height
//        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
//        if landscapeMode {
//
//            blueBox1.frame.origin.y = 32
//            blueBox2.frame.origin.y = 32
//        }
//        
//        blueBox1.frame.origin.y = navBarHeight
//        blueBox2.frame.origin.y = navBarHeight
//        
//    }
    
    
    // DID NOT WORK
    //  var blueBox1 = UIView(frame: CGRect(x: 0, y: navigationController!.navigationBar.frame.maxY, width: 20, height: 20))
    
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
