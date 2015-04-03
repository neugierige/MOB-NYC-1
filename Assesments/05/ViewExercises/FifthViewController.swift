//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//
/* TODO:
Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.

Use Autolayout.

Your view should be in self.exerciseView, not self.view
*/


import UIKit

class FifthViewController: ExerciseViewController {

    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        createViews()
        addViews()
        addConstraints()
        
    }
    
    
    func createViews() {
        
        button.backgroundColor = UIColor.greenColor()
        button.layer.borderColor = UIColor.redColor().CGColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(10)
        button.setTitle("tap me", forState: UIControlState.Normal)
        button.addTarget(self, action: "tapButton", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    
    func addViews() {
        
        self.exerciseView.addSubview(button)
        
    }
    
    func addConstraints() {
        
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0))
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 100.0))
        view.addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 100.0))
    }
    
    
    func tapButton() {
        
        UIView.animateWithDuration(2.0, delay: 0, options: UIViewAnimationOptions.Autoreverse, animations: {
            self.button.backgroundColor = UIColor.redColor()
            self.button.frame.origin.y = self.button.frame.origin.y - 20
            }, completion: {complete in
                self.button.backgroundColor = UIColor.greenColor()
                self.button.frame.origin.y = self.button.frame.origin.y + 20
        })
    }
    
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
