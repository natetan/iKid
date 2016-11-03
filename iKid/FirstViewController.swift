//
//  FirstViewController.swift
//  iKid
//
//  Created by Yulong Tan on 11/2/16.
//  Copyright © 2016 yulongproductions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    private var firstViewController : FirstViewController!
    private var firstJokeViewController : FirstJokeViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(_ sender: AnyObject) {
        firstBuilder()
        firstJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            firstJokeViewController.view.frame = view.frame
            switchViewController(from: firstViewController, to: firstJokeViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(from: firstJokeViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    public func hideJoke() {
        jokeLabel.text = ""
    }
    
    private func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "First")
                as! FirstViewController
        }
    }
    private func firstJokeBuilder() {
        if firstJokeViewController == nil {
            firstJokeViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "First Joke")
                as! FirstJokeViewController
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

