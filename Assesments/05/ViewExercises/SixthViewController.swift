//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    var greenLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
        
    }
    
    /* TODO:
    The table view cells on this screen are blank.
    
    Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
    */

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        greenLabel.backgroundColor = UIColor.greenColor()
        tableView.addSubview(greenLabel)
        greenLabel.text = "Row \(indexPath.row + 1)"
        greenLabel.textColor = UIColor.blackColor()
        greenLabel.textAlignment = NSTextAlignment.Center

        var cellProxy = cell?.frame ?? exerciseView.frame
        
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.Left,
            relatedBy: .Equal,
            toItem: cellProxy.minX,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0.0))
        view.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: .Equal,
            toItem: cellProxy.minY,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0))
//        view.addConstraint(NSLayoutConstraint(
//            item: greenLabel,
//            attribute: NSLayoutAttribute.Width,
//            relatedBy: .Equal,
//            toItem: cellProxy,
//            attribute: .Width,
//            multiplier: 1.0,
//            constant: 0.0))
//        view.addConstraint(NSLayoutConstraint(
//            item: greenLabel,
//            attribute: NSLayoutAttribute.Height,
//            relatedBy: .Equal,
//            toItem: cell,
//            attribute: .Height,
//            multiplier: 1.0,
//            constant: 0.0))
        
        
        return cell!
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
