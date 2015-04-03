//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//
/* TODO:
The table view cells on this screen are blank.

Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
*/

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "Cell")

        let greenLabel = UILabel()
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        cell.contentView.addSubview(greenLabel)
        let rowIndex = indexPath.row + 1
        greenLabel.backgroundColor = UIColor.greenColor()
        greenLabel.text = "Row \(rowIndex)"
        greenLabel.textColor = UIColor.blackColor()
        greenLabel.textAlignment = NSTextAlignment.Center
        
        cell.contentView.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: .Equal,
            toItem: cell.contentView,
            attribute: .CenterX,
            multiplier: 1, constant: 0))
        cell.contentView.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: .Equal,
            toItem: cell.contentView,
            attribute: .CenterY,
            multiplier: 1, constant: 0))
        cell.contentView.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: cell.contentView,
            attribute: .Width,
            multiplier: 1, constant: -30))
        cell.contentView.addConstraint(NSLayoutConstraint(
            item: greenLabel,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: cell.contentView,
            attribute: .Height,
            multiplier: 1, constant: -10))
        
        return cell
    }
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
