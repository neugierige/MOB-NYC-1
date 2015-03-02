//
//  ViewController.swift
//  GooglePrinter
//
//  Created by Rudd Taylor on 2/25/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        if let url = NSURL(string: "http://google.com") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                var string = NSString(data: data, encoding: NSUTF8StringEncoding)
                dispatch_async(dispatch_get_main_queue(), {
                    self.textView.text = string
                })
            })
            task.resume()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

