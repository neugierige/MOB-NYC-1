//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //NOT WORKING
    //how to save values from the settings??
    
    
    @IBOutlet var textView2: UITextView!
    
    var myString = "settings_name"
    var mySliderValue = "settings_slider"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = NSUserDefaults.standardUserDefaults().stringForKey(myString)
        let float = NSUserDefaults.standardUserDefaults().stringForKey(mySliderValue)
        
        textView2.text = "String is: \(string). Float is \(float)"
        
    }
    
}

//    func saveSliderValue() {
//        NSUserDefaults.standardUserDefaults().setFloat(mySliderValue, forKey: "sliderValueFloat")
//    }
//
//
//    func showString() {
//        textView.text = NSUserDefaults.standardUserDefaults().objectForKey("textValueString") as String
//    }
//
//    func showSlider() {
//        mySliderValue = NSUserDefaults.standardUserDefaults().floatForKey("sliderValueFloat")
//    }

