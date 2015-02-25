//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet var textView3: UITextView!
    
    @IBAction func tappedNext(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(textView3.text, forKey: "stringFromTextView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView3.text = NSUserDefaults.standardUserDefaults().objectForKey("stringFromTextView") as? String ?? textView3.text
    }
}
