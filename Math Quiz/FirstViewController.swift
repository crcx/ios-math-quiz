//
//  FirstViewController.swift
//  Math Quiz
//
//  Created by Charles Childers on 10/19/14.
//  Copyright (c) 2014 Charles Childers. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var settings: SettingsDataStore!

    @IBOutlet weak var top: UILabel!
    @IBOutlet weak var middle: UILabel!
    @IBOutlet weak var bottom: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var a: Int = 0
    var b: Int = 0
    var correct: Int = 0
    var incorrect: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        top.text = "Value #1"
        middle.text = "x"
        bottom.text = "Value #2"
        
        var tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
        settings = SettingsDataStore.sharedInstance
        generateNewProblem()
    }
    
    func updateProblem(first: String, second: String) {
        top.text = first;
        bottom.text = second;
        a = first.toInt()!
        b = second.toInt()!
        switch (settings.getGameMode()) {
            case 0: middle.text = "+"
                break
            case 1: middle.text = "-"
                break
            case 2: middle.text = "x"
                break
            case 3: middle.text = "/"
                break
            default:
                break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateNewProblem() {
        var f: Int
        var s: Int
        
        f = (Int)(arc4random() % 12)
        s = (Int)(arc4random() % 12)
        updateProblem("\(f)", second: "\(s)")
    }
    
    @IBAction func buttonWasPressed(sender: AnyObject) {
        var expected = 0
        switch (settings.getGameMode()) {
        case 0: expected = a + b
            break
        case 1: expected = a - b
            break
        case 2: expected = a * b
            break
        case 3: expected = a / b
            break
        default:
            break
        }

        if answer.text.toInt()! == expected {
            var alert = UIAlertView(title: "Correct!", message:"", delegate: self, cancelButtonTitle:nil)
            alert.show()
            alert.dismissWithClickedButtonIndex(0, animated: true)
            correct++
            answer.text = ""
            generateNewProblem()
        } else {
//            self.view.backgroundColor = UIColor.redColor()
            var alert = UIAlertView(title: "Sorry, try again!", message:"", delegate: self, cancelButtonTitle:nil)
            alert.show()
            alert.dismissWithClickedButtonIndex(0, animated: true)
            incorrect++
        }
    }
    
    func dismissKeyboard() {
        answer.resignFirstResponder()
    }

}

