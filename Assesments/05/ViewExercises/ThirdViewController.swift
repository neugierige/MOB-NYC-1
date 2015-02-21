//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        //EXERCISEVIEW setup
        exerciseView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: exerciseView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0.0))
//        exerciseView.backgroundColor = UIColor.grayColor()
//        exerciseView.alpha = 0.5
//        exerciseView.layer.borderColor = UIColor.redColor().CGColor
//        exerciseView.layer.borderWidth = 5.0
        
        var ul = UIView()
        var ur = UIView()
        var ll = UIView()
        var lr = UIView()
        
        for view in [ul, ur, ll, lr] {
            view.backgroundColor = UIColor.blueColor()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            self.exerciseView.addSubview(view)
            self.exerciseView.addConstraint(NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
            self.exerciseView.addConstraint(NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        }
        
        //Layout for Boxes
        for topBoxes in [ul, ur] {
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: topBoxes,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: self.exerciseView,
                attribute: .Top,
                multiplier: 1.0,
                constant: 0))
        }
        
        for bottomBoxes in [ll, lr] {
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: bottomBoxes,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: .Equal,
                toItem: exerciseView,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: -44))
        }
        
        for leftBoxes in [ul, ll] {
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: leftBoxes,
                attribute: NSLayoutAttribute.Left,
                relatedBy: .Equal,
                toItem: exerciseView,
                attribute: .Left,
                multiplier: 1.0,
                constant: 0.0))
        }
        
        for rightBoxes in [ur, lr] {
            self.exerciseView.addConstraint(NSLayoutConstraint(
                item: rightBoxes,
                attribute: NSLayoutAttribute.Right,
                relatedBy: .Equal,
                toItem: exerciseView,
                attribute: .Right,
                multiplier: 1.0,
                constant: 0.0))
        }
    }
    
    
//        if let navBar: UINavigationBar = self.navigationController?.navigationBar {
//            var navBarHeight = navBar.frame.maxY
//        
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxOne,
//                attribute: .Top,
//                relatedBy: .Equal,
//                toItem: self.exerciseView,
//                attribute: .Bottom,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxOne,
//                attribute: .Bottom,
//                relatedBy: .Equal,
//                toItem: exerciseDescription,
//                attribute: .Top,
//                multiplier: 1.0,
//                constant: navBarHeight + 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxOne,
//                attribute: .Left,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Left,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxOne,
//                attribute: .Width,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1.0,
//                constant: 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxOne,
//                attribute: .Height,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1.0,
//                constant: 20))

//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxTwo,
//                attribute: .Top,
//                relatedBy: .Equal,
//                toItem: self.topLayoutGuide,
//                attribute: .Bottom,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxTwo,
//                attribute: .Right,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Right,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxTwo,
//                attribute: .Width,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxTwo,
//                attribute: .Height,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxThree,
//                attribute: NSLayoutAttribute.Bottom,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Bottom,
//                multiplier: 1.0,
//                constant: -44))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxThree,
//                attribute: NSLayoutAttribute.Left,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Left,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxThree,
//                attribute: .Width,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxThree,
//                attribute: .Height,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
    
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxFour,
//                attribute: .Bottom,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Bottom,
//                multiplier: 1.0,
//                constant: -44))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxFour,
//                attribute: NSLayoutAttribute.Right,
//                relatedBy: .Equal,
//                toItem: exerciseView,
//                attribute: .Right,
//                multiplier: 1.0,
//                constant: 0))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxFour,
//                attribute: .Width,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
//            view.addConstraint(NSLayoutConstraint(
//                item: blueBoxFour,
//                attribute: .Height,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: NSLayoutAttribute.NotAnAttribute,
//                multiplier: 1,
//                constant: 20))
//
//            self.exerciseView.layoutIfNeeded()
//        }
    
    
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }
}
