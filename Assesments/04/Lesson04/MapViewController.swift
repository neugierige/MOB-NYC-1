//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textFieldKey: UITextField!
    @IBOutlet var textFieldValue: UITextField!
    
    
    var dictionaryOfStrings: [Dictionary<String, String>] = []
    var didNotWork = [String: String]()
    //    var key: String = ""
    //    var value: String = ""
    //    var tasks: [Dictionary<String, String>] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyboard", name: UIKeyboardDidShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyboard", name: UIKeyboardDidHideNotification, object: nil)
    }

    func showKeyboard() {
        textFieldKey.backgroundColor = UIColor.blueColor()
        textFieldValue.backgroundColor = UIColor.blueColor()
    }
    
    func hideKeyboard() {
        textFieldKey.backgroundColor = UIColor.redColor()
        textFieldValue.backgroundColor = UIColor.redColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == textFieldValue {
            if let key = textFieldKey.text {
                if let value = textFieldValue.text {
                    var newItem = ["key": key, "value": value]
                    dictionaryOfStrings.append(newItem)
                }
            }
            tableView.reloadData()
        }
        return true
    }
    


//       ** WHAT DID NOT WORK **     //

//    func textFieldShouldReturn(TextField: UITextField) -> Bool {
//        tableView.reloadData()
////        textFieldKey.text = key
////        textFieldValue.text = value
//        
//        dictionaryOfStrings["\(textFieldKey.text)"] = "\(textFieldValue.text)"
//    
//        var inputKey = textFieldKey.text
//        var inputValue = textFieldValue.text
//        var inputPair = [inputKey: inputValue]
////        dictionaryOfStrings.append(inputPair)
////        dictionaryOfStrings["\(inputKey)"] = ["\(inputValue)"]
//        return true
//    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if let inputKey = textFieldKey.text {
//            if let inputValue = textFieldValue.text {
//                dictionaryOfStrings[inputKey] = [inputValue]
//            }
//        }
//        tableView.reloadData()
//        return true
//    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaryOfStrings.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath) as UITableViewCell

        if let newItemKey = dictionaryOfStrings[indexPath.row]["key"] {
            cell.textLabel?.text = newItemKey
            }
        
        if let newItemValue = dictionaryOfStrings[indexPath.row]["value"] {
            cell.detailTextLabel?.text = "value: " + newItemValue
        }
        
//        cell.textLabel?.text = textFieldKey.text

//        let eachItem = dictionaryOfStrings[indexPath.row]
//        var cellLabel = dictionaryOfStrings {
//            var cellDisplay = "\(eachItem)"
        
        return cell
    }

    

    
        
        
//        me("itemAdded", object: nil, queue: nil) { (notification: NSNotification!) -> Void in
//            println("it worked")
//            UIView.animateWithDuration(5, animations: {
//                self.todoAddedLabel.alpha = 1.0
//            })

}
    
   
    
    
    
//    REFERENCE
//    let eachToDo = todos[indexPath.row]
//    
//    if let todo = todoDictionaries[eachToDo] {
//        var cellDisplay = "\(eachToDo): status \(todo.0), due \(todo.1)"
//        cell.textLabel?.text = cellDisplay
    
    /*
        !DONE - TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        !DONE - TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        ********
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */

