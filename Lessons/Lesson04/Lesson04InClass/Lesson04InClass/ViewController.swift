import UIKit

class ViewController: UIViewController {
    @IBAction func didSwipe(sender: AnyObject){
        label.text = "Swipe!"
    }
    
// "UIViewController" is the type
/*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
*/
    

    @IBOutlet var textField: UITextField!
    @IBOutlet var textFieldTwo: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func didTapButton(sender: AnyObject) {
        println("we made it!")
//        label.text = "Hello! \(textField.text)"
        todo5(textField.text.toInt()!)
//        label.text = "\(fibNum)"
//
//        var sum = todo9(textField.text.toInt(), textFieldTwo.text.toInt())
//        var tip = 
//        label.text = "\(sum)"
}
    
// " " makes it a string
// FYI label is a class, it has text
//self.view.backgroundColor = UIColor.redColor()

// outlet correspond to variables
// actions or events correspond to ations
// Functions of use for this exercise:
// Translating a string to an integer: "1".toInt()
// Getting the text from a text field: let text = textFieldName.text
// Setting the text on a text label or text field: textLabelName.text = "some text"
    
    
    /*
    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
    */
    
    
    func todo5(n:Int) {
        var n1 = 0, n2 = 1, n3 = 1
        if n == 0 {
            label.text = "try again"
        } else if n == 1 {
            label.text = String(n1)
        } else if n == 1 {
            label.text = String(n2)
        } else if n == 2 {
            label.text = String(n3)
        } else {
            for index in 3...n {
                n1 = n2
                n2 = n3
                n3 = n1 + n2
            }
            label.text = String (n3)
        }
    }

    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */
    

    
    func todo9(billAmount: Int, tipPercent: Int) -> (Int, Int) {
        return (billAmount + billAmount * tipPercent / 100, billAmount * tipPercent / 100)
    }
    
}



