//
//  ViewController.swift
//  Test
//
//  Created by Rudd Taylor on 1/14/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
// only one of these things is a class - "UITableViewController"
// other two are "protocols" - do not define behavior - grouping of functions and variables that some class has to have
// protocols = shorthand for "my class a certain set of methods"
    
    let teachers = ["Rudd", "Travis", "Sean"]

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = teachers[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}

