//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    
    @IBOutlet var taskNameField: UITextField!
    @IBOutlet var statusField: UITextField!
    @IBOutlet weak var dueDateField: UITextField!

    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        let newTaskName = taskNameField.text
        let newTaskStatus = statusField.text
        let newTaskDueDate = dueDateField.text
        var newTask = ["taskName": newTaskName, "taskStatus": newTaskStatus, "taskDate": newTaskDueDate] as [String: String]
        todoViewController?.todoDictionaries.append(newTask)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
//    var todoDictionaries = [
//        ["groceries": ("pending", "1/26")],
//        ["homework": ("in progress", "1/26")],
//        ["walk dog": ("unknown", "1/26")]
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

