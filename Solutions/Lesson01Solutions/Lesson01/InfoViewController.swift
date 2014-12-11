//
//  InfoViewController.swift
//  Lesson01
//
//  Created by trvslhlt on 12/10/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

  @IBOutlet weak var dismissButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Configuration
  
  func configureViews() {
    if self.navigationController != nil {
      self.dismissButton.hidden = true
    }
  }
  
  // MARK: IBActions
  
  @IBAction func dismissButtonTapped(sender: AnyObject) {
    if self.navigationController == nil {
      self.dismissViewControllerAnimated(true, completion: nil)
    }
  }
  
  
}
