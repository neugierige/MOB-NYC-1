//
//  DismissViewController.swift
//  Lesson03
//
//  Created by Luyuan Xing on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class DismissViewController: UIViewController {

//properties
//lifecycle
//ibaction
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTouchDismiss(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
    }

}
