//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        
        addViews()

    }
    
    
    /* TODO:
    Build a scroll view that takes up the entire screen.
    
    In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen), a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
    
    Use Autolayout.
    
    
    Your view should be in self.exerciseView, not self.view.
    */
    
    func addViews() {
        
        var navBarHeight = self.navigationController?.navigationBar.frame.maxY ?? exerciseView.frame.minY
        
//        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
//        
//        view.addConstraint(NSLayoutConstraint(
//            item: scrollView,
//            attribute: .Top,
//            relatedBy: .Equal,
//            toItem: exerciseView,
//            attribute: .Top,
//            multiplier: 1.0,
//            constant: navBarHeight + 20))
//        view.addConstraint(NSLayoutConstraint(
//            item: scrollView,
//            attribute: .Bottom,
//            relatedBy: .Equal,
//            toItem: exerciseView,
//            attribute: .Bottom,
//            multiplier: 1.0,
//            constant: 0))
//        view.addConstraint(NSLayoutConstraint(
//            item: scrollView,
//            attribute: .Width,
//            relatedBy: .Equal,
//            toItem: exerciseView,
//            attribute: .Width,
//            multiplier: 1,
//            constant: 0))
//
        
        
        
        exerciseView.addSubview(scrollView)
        scrollView.frame = exerciseView.bounds
        
//        let labelSize = CGSize(width: scrollView.frame.width, height: 1000)
//        scrollView.contentSize = labelSize
//        let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: labelSize))
        
        let labelTwo = UILabel(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: 1000))
        scrollView.contentSize = labelTwo.frame.size

//        labelTwo.backgroundColor = UIColor.purpleColor()
//        labelTwo.text = "FOO!"
//        labelTwo.textColor = UIColor.whiteColor()
//        labelTwo.textAlignment = NSTextAlignment.Center
//        
//        scrollView.addSubview(labelTwo)
        
        
        var purpleLabel = UILabel()
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.text = "FOO!"
        purpleLabel.textAlignment = NSTextAlignment.Center
        
        view.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Top, relatedBy: .Equal, toItem: exerciseView, attribute: .Top, multiplier: 1, constant: navBarHeight))
        view.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Width, relatedBy: .Equal, toItem: exerciseView, attribute: .Width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 1000))
        scrollView.addSubview(purpleLabel)

        
        var blueBoxTop = UIView()
        blueBoxTop.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(blueBoxTop)
        blueBoxTop.backgroundColor = UIColor.blueColor()
        
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTop,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Top,
            multiplier: 1.0,
            constant: navBarHeight + 20))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTop,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Left,
            multiplier: 1.0,
            constant: 10))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTop,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 20))
        view.addConstraint(NSLayoutConstraint(
            item: blueBoxTop,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 20))
        
        var redBoxBottom = UIView()
        redBoxBottom.setTranslatesAutoresizingMaskIntoConstraints(false)
        scrollView.addSubview(redBoxBottom)
        redBoxBottom.backgroundColor = UIColor.redColor()
        view.addConstraint(NSLayoutConstraint(
            item: redBoxBottom,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Bottom,
            multiplier: 1,
            constant: -64))
        view.addConstraint(NSLayoutConstraint(
            item: redBoxBottom,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: exerciseView,
            attribute: .Left,
            multiplier: 1,
            constant: 10))
        view.addConstraint(NSLayoutConstraint(
            item: redBoxBottom,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 20))
        view.addConstraint(NSLayoutConstraint(
            item: redBoxBottom,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: 20))
    }
    
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
