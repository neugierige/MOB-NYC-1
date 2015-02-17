//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textFieldOne: UITextField!
    @IBOutlet var textFieldTwo: UITextField!
    @IBOutlet var textFieldThree: UITextField!
    
    var todoViewController: MainTableViewController?
    
    func assignNewItem() {
        let fieldOne = textFieldOne.text as String
        let fieldTwo = textFieldTwo.text as String
        let fieldThree = textFieldThree.text as String
        var newItem = ["taskName": fieldOne, "status": fieldTwo, "dueDate": fieldThree]
        todoViewController?.todos.append(newItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func todoAdded() {
        var addedNotification = NSNotificationCenter.defaultCenter()
        addedNotification.postNotificationName("todo Added", object: nil)
    }
    
    @IBAction func didTapButton(sender: AnyObject) {
//    todoViewController?.todos.append(textField.text)
        assignNewItem()
        todoAdded()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       assignNewItem()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldOne.delegate = self
        self.textFieldTwo.delegate = self
        self.textFieldThree.delegate = self
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: nil) { (notification: NSNotification!) -> Void in
            self.textFieldOne.backgroundColor = UIColor.redColor()
        // <#(NSNotification!) -> Void##(NSNotification!) -> Void#> = closure
        
/*        var test = NSNotificationCenter.defaultCenter()
            notificationCenter.addObserverForName(<#name: String?#>, object: <#AnyObject?#>, queue: <#NSOperationQueue?#>, usingBlock: <#(NSNotification!) -> Void##(NSNotification!) -> Void#>)
*/
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textFieldOne == textField {
            textField.placeholder = "enter a task here"
        }
        if textFieldTwo == textField {
            textField.placeholder = "enter the status here"
        }
        if textFieldThree == textField {
            textField.placeholder = "enter the due date here"
        }
    }
}











