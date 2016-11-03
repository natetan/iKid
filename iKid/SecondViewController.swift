//
//  SecondViewController.swift
//  iKid
//
//  Created by Yulong Tan on 11/2/16.
//  Copyright © 2016 yulongproductions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    public var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func flip(_ sender: AnyObject) {
        if (count % 2 == 0) {
            jokeLabel.text = "Iran"
        } else {
            jokeLabel.text = "While on a camping trip in Iraq, I was under fire. How did I escape?"
        }
        UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        count = count + 1
    }
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    
    
}

