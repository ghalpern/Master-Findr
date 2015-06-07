//
//  LoginVC.swift
//  MasterFindrHome
//
//  Created by Georgie Halpern on 6/6/15.
//  Copyright (c) 2015 ghalpern. All rights reserved.
//

import UIKit
import CoreData
class LoginVC: UIViewController {

    var managedObjectContext: NSManagedObjectContext! = nil
    let MyKeychainWrapper = KeychainWrapper()
    let createLoginButtonTag = 0
    let loginButtonTag = 1
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var createInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
        
        // 2.
        if hasLogin {
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            loginButton.tag = loginButtonTag
            createInfoLabel.hidden = true
        } else {
            loginButton.setTitle("Signup", forState: UIControlState.Normal)
            loginButton.tag = createLoginButtonTag
            createInfoLabel.hidden = false
        }
        
        // 3.
        if let storedUsername = NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
            usernameTextField.text = storedUsername as String
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginTapped(sender: UIButton) {
        if (usernameTextField.text == "" || passwordTextField.text == "") {
            var alert = UIAlertView()
            alert.title = "You must enter both a username and password!"
            alert.addButtonWithTitle("Oops!")
            alert.show()
            return;
        }
        
        // 2.
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        // 3.
        if sender.tag == createLoginButtonTag {
            
            // 4.
            let hasLoginKey = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
            if hasLoginKey == false {
                NSUserDefaults.standardUserDefaults().setValue(self.usernameTextField.text, forKey: "username")
            }
            
            // 5.
            MyKeychainWrapper.mySetObject(passwordTextField.text, forKey:kSecValueData)
            MyKeychainWrapper.writeToKeychain()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasLoginKey")
            NSUserDefaults.standardUserDefaults().synchronize()
            loginButton.tag = loginButtonTag
            
            performSegueWithIdentifier("dismissLogin", sender: self)
        } else if sender.tag == loginButtonTag {
            // 6.
            if checkLogin(usernameTextField.text, password: passwordTextField.text) {
                performSegueWithIdentifier("dismissLogin", sender: self)
            } else {
                // 7.
                var alert = UIAlertView()
                alert.title = "Login Problem"
                alert.message = "Wrong username or password."
                alert.addButtonWithTitle("Foiled Again!")
                alert.show()
            }
        }

    }
    
    func checkLogin(username: String, password: String ) -> Bool {
        if password == MyKeychainWrapper.myObjectForKey("v_Data") as? String &&
            username == NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
                return true
        } else {
            return false
        }
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
