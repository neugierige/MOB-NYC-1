//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var myString = "Hi, I'm a string!"
    var myInt = 666
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setObject(myString, forKey: "test_string")
        NSUserDefaults.standardUserDefaults().setObject(myInt, forKey: "test_number")
        showStringAndInt()
    }
    
    
    func showStringAndInt() {
        
        myInt = NSUserDefaults.standardUserDefaults().integerForKey("test_number")
        myString = NSUserDefaults.standardUserDefaults().stringForKey("test_string") ?? ""
        
        textView.text = "\(myString) \r\(myInt)"
    }

}