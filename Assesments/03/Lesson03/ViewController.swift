//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBAction func didTapTableView() {
        performSegueWithIdentifier("show", sender: nil)
    }

    @IBAction func swipe(sender: AnyObject) {
        performSegueWithIdentifier("modal", sender: nil)
    }
    
//    @IBAction func swipeRight() {
//        performSegueWithIdentifier("modal", sender: nil)
//    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        prepareSwipe()
//    }

// PURELY PROGRAMMATIC SOLUTION
//    func prepareSwipe () {
//        let swipySwipe = UISwipeGestureRecognizer(target: self, action: Selector("didSwipe:"))
//        //target send the action to its own class - "Target Action"
//        //"selector" refers to the "didSwipe" function. Colon means it takes a parameter
//        label.addGestureRecognizer(swipySwipe)
//    }
//    
//    func didSwipe(sender: UISwipeGestureRecognizer) {
//        let storyboard = UIStoryboard(name:"Main", bundle: nil)
//        let dismissVC = storyboard.instantiateViewControllerWithIdentifier("DismissViewController") as DismissViewController
//        self.presentViewController(dismissVC, animated: true, completion: nil)
//    }
    
}
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */


