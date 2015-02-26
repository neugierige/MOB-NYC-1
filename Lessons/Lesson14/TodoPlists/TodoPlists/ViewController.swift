//
//  ViewController.swift
//  TodoPlists
//
//  Created by Rudd Taylor on 2/23/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIAlertViewDelegate {

    var items: [[String:String]] = [] //[["Name": "SomeNameHere", "Content": "SomeContentHere"], ["Name": "AnotherName", "Content": "MoreContent"]]
    
    @IBAction func didTapAdd(sender: AnyObject) {
        var alert = UIAlertView(title: "Item Name?", message: "Enter an item name", delegate: self, cancelButtonTitle: "Dismiss", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            if let textInAlert = alertView.textFieldAtIndex(0)?.text {
                self.items.append(["Name": textInAlert, "Content": "none yet"])
                self.tableView.reloadData()
                saveNewItem()
            }
        }
    }
    
    func saveNewItem() {
        let convertedArray: NSArray = items
        convertedArray.writeToURL(fileURL(), atomically: true)
    }
    
    func fileURL() -> NSURL {
        var someURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        var filePath = someURL.URLByAppendingPathComponent("ToDoList.plist")
        return filePath
    }

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileURL()
        let savedArray = NSArray(contentsOfURL: fileURL())
        self.items = (savedArray as Array)
        
    }

    //        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
    //            if let string = NSBundle.mainBundle().pathForResource("ToDoList", ofType: "plist") {
    //
    //                //unwrap array
    //                if let array = NSArray(contentsOfFile: string) {
    //                    items = array as Array
    //                }
    //            }
    //            let filePath = documentPath.URLByAppendingPathComponent("file.plist", isDirectory: false)
    //        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        }
        var stringAtSpecifiedIndex = self.items[indexPath.row]["Name"]
        cell.textLabel?.text = stringAtSpecifiedIndex
        cell.detailTextLabel?.text = self.items[indexPath.row]["Content"]
        return cell
    }

}

