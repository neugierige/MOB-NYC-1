//
//  AnimalSubclass.swift
//  Lesson03
//
//  Created by Luyuan Xing on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class AnimalSubclass: Animal {

    override func prettyAnimalName() -> String {
        return ("\(name) is my dog")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
