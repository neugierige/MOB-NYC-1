// Assignment 8 playground

import Foundation
import XCPlayground
//import SwiftyJSON


// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

func printGoogle() {
    if let url = NSURL(string: "http://google.com") {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            var string = NSString(data: data, encoding: NSUTF8StringEncoding)
            dispatch_async(dispatch_get_main_queue(), {
                println(string)
            })
        })
        task.resume()
    }
}



//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

func falseNetwork() {
    if let url = NSURL(string: "http://generalassemb.ly/foobar.baz") {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            var error = error.userInfo
                println(error)
        })
        task.resume()
    }
}



//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

func todoThree() {
    var json: NSDictionary?
    if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US") {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            var jsonError: NSError?
            if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
                json = jsonDict
                dispatch_async(dispatch_get_main_queue(), {
                })
            }
        })
        task.resume()
    }
}



//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

func todoFour() {
    
}



