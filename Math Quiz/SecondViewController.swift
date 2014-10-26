//
//  SecondViewController.swift
//  Math Quiz
//
//  Created by Charles Childers on 10/19/14.
//  Copyright (c) 2014 Charles Childers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lowerLimit: UITextField!
    @IBOutlet weak var upperLimit: UITextField!
    @IBOutlet weak var operationChoice: UISegmentedControl!

    @IBAction func gameModeChanged(sender: AnyObject) {
    }
    
    @IBAction func limtChanged(sender: AnyObject) {
        var id = sender as NSObject;
        if id == lowerLimit {
            NSLog(lowerLimit.text)
        }
        if id == upperLimit {
            NSLog(upperLimit.text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

