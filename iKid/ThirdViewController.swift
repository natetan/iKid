//
//  SecondViewController.swift
//  iKid
//
//  Created by Yulong Tan on 11/2/16.
//  Copyright © 2016 yulongproductions. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private var thirdViewController : ThirdViewController!
    private var thirdJokeViewController : ThirdJokeViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(_ sender: AnyObject) {
        ThirdBuilder()
        ThirdJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if thirdViewController != nil &&
            thirdViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thirdJokeViewController.view.frame = view.frame
            switchViewController(from: thirdViewController, to: thirdJokeViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            thirdViewController.view.frame = view.frame
            switchViewController(from: thirdJokeViewController, to: thirdViewController)
        }
        UIView.commitAnimations()
    }
    
    private func ThirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Third")
                as! ThirdViewController
        }
    }
    private func ThirdJokeBuilder() {
        if thirdJokeViewController == nil {
            thirdJokeViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Third Joke")
                as! ThirdJokeViewController
        }
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    
    
}

