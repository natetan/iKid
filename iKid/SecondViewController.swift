//
//  SecondViewController.swift
//  iKid
//
//  Created by Yulong Tan on 11/2/16.
//  Copyright © 2016 yulongproductions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var secondViewController : SecondViewController!
    private var secondJokeViewController : SecondJokeViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(_ sender: AnyObject) {
        secondBuilder()
        secondJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if secondViewController != nil &&
            secondViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondJokeViewController.view.frame = view.frame
            switchViewController(from: secondViewController, to: secondJokeViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(from: secondJokeViewController, to: secondViewController)
        }
        UIView.commitAnimations()
    }
    
    private func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Second")
                as! SecondViewController
        }
    }
    private func secondJokeBuilder() {
        if secondJokeViewController == nil {
            secondJokeViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Second Joke")
                as! SecondJokeViewController
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

