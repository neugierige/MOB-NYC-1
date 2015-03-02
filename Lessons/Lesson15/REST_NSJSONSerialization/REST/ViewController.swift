//
//  ViewController.swift
//  REST
//
//  Created by Rudd Taylor on 2/25/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var json: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if let url = NSURL(string: "http://mashable.com/stories.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                var jsonError: NSError?
                if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
                    self.json = jsonDict
                    
                    // Required! We must update the UI only on the main queue, but this completion handler gets run in the background queue!
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            })
            // Required to start the network task
            task.resume()
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let json = self.json {
            if let newItem = json["new"] as? NSArray {
                return newItem.count
            }
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        if let json = self.json {
            if let newItem = json["new"] as? NSArray {
                cell.textLabel?.text = newItem[indexPath.row]["title"] as? String
                cell.detailTextLabel?.text = newItem[indexPath.row]["author"] as? String
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let json = self.json {
            if let newItem = json["new"] as? NSArray {
                if let story = newItem[indexPath.row] as? NSDictionary {
                    if let link = story["link"] as? NSString {
                            if let url = NSURL(string: link) {
                                performSegueWithIdentifier("web", sender: NSURLRequest(URL: url))
                        }
                    }
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }
}

/*
if let json = self.json {
    if let newItem = json["new"] as? NSArray {
        if let title = newItem[indexPath.row] as? NSDictionary {
            if let story = title[indexPath.row] as? NSDictionary {
                if let link = story["link"] as? NSString {
                    if let url = NSURL(string: link) {
                        performSegueWithIdentifier("web", sender: NSURLRequest(URL: url))
                    }
                }
            }
        }
    }
}
*/
