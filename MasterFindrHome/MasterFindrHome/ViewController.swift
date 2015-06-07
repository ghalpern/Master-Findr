//
//  ViewController.swift
//  MasterFindrHome
//
//  Created by Georgie Halpern on 6/5/15.
//  Copyright (c) 2015 Georgie Halpern. All rights reserved.
//
import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet var homeView: UIView!
    
    var isAuthenticated = false
    
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController? = nil
    
    var didReturnFromBackground = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:", name: UIApplicationWillResignActiveNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)

    }
    
    @IBAction func unwindSegueToHome(segue: UIStoryboardSegue) {
        
        isAuthenticated = true
        view.alpha = 1.0
    }
    

    func appWillResignActive(notification : NSNotification) {
        
        view.alpha = 0
        isAuthenticated = false
        didReturnFromBackground = true
    }
    
    func appDidBecomeActive(notification : NSNotification) {
        
        if didReturnFromBackground {
            self.showLoginView()
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(false)
        self.showLoginView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func showLoginView() {
        
        if !isAuthenticated {
            self.performSegueWithIdentifier("goto_login", sender: self)
        }
    }
    
    
    @IBAction func logoutAction(sender: UIButton) {
           isAuthenticated = false
        self.performSegueWithIdentifier("goto_login", sender: self)
    }

    
}

