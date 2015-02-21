//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        constrainExerciseView()
        addScrollView()
        addContainerView()
        addLabel()
        addBoxes()
    }
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    var purpleLabel = UILabel()
    let blueBox = UIView()
    let redBox = UIView()
    
    
    func constrainExerciseView() {
        exerciseView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -44.0))
        exerciseView.backgroundColor = UIColor.yellowColor()
    }
    
    func addScrollView() {
        exerciseView.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.redColor()
        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        var offsetAmount: CGFloat = 5.0
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1.0, constant: offsetAmount))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1.0, constant: offsetAmount))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1.0, constant: -offsetAmount))
        self.view.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1.0, constant: -offsetAmount))
    }
    


    func addContainerView() {
        scrollView.addSubview(containerView)
        containerView.backgroundColor = UIColor.greenColor()
        
        var offsetAmount: CGFloat = 10.0
        containerView.frame = CGRect(x: offsetAmount, y: offsetAmount, width: 320-3*offsetAmount, height: 1030)
        scrollView.contentSize = CGSize(width: containerView.bounds.width, height: containerView.bounds.height + offsetAmount)
        //scrollView.contentSize = containerView.bounds.size

    }
    
    
    func addLabel() {
        containerView.addSubview(purpleLabel)
        var offsetAmount: CGFloat = 15.0
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.text = "FOO"
        purpleLabel.textAlignment = NSTextAlignment.Center
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Top, relatedBy: .Equal, toItem: containerView , attribute: .Top, multiplier: 1.0, constant: offsetAmount))
        self.containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Left, relatedBy: .Equal, toItem: containerView , attribute: .Left, multiplier: 1.0, constant: offsetAmount))
        self.containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Right, relatedBy: .Equal, toItem: containerView , attribute: .Right, multiplier: 1.0, constant: -offsetAmount))
        self.containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 1000.0))
    }
    
    
    func addBoxes() {
        containerView.addSubview(blueBox)
        containerView.addSubview(redBox)
        
        var size: CGFloat = 20.0
        blueBox.backgroundColor = UIColor.blueColor()
        redBox.backgroundColor = UIColor.redColor()
        
        for boxes in [blueBox, redBox] {
            boxes.setTranslatesAutoresizingMaskIntoConstraints(false)
           
            containerView.addConstraint(NSLayoutConstraint(item: boxes, attribute: .LeftMargin, relatedBy: .Equal, toItem: purpleLabel, attribute: .LeftMargin, multiplier: 1.0, constant: 10))
            containerView.addConstraint(NSLayoutConstraint(item: boxes, attribute: .RightMargin, relatedBy: .Equal, toItem: purpleLabel, attribute: .RightMargin, multiplier: 1.0, constant: -10))
            containerView.addConstraint(NSLayoutConstraint(item: boxes, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: size))
        }
        
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Top, relatedBy: .Equal, toItem: purpleLabel, attribute: .Top, multiplier: 1.0, constant: size))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Bottom, relatedBy: .Equal, toItem: purpleLabel, attribute: .Bottom, multiplier: 1.0, constant: -size))
    }
    
    
    
    /* TODO:
    Build a scroll view that takes up the entire screen.
    
    In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen), a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
    
    Use Autolayout.
    
    Your view should be in self.exerciseView, not self.view.
    */

    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}