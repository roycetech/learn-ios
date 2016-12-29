//
//  ViewController.swift
//  Instagram Clone Demo
//
//  Created by Royce on 25/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonSignUpOrLogin: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var buttonChangeSignUpMode: UIButton!
    
    
    var activityIndicator: UIActivityIndicatorView!
    var signUpMode = true
    
    
    var parseContext: ParseContext!
    
//    var parseContext:ParseContext {
//        guard _parseContext == nil else {
//            return _parseContext
//        }
//        
//        _parseContext = ParseContext(controller: self)
//        return _parseContext
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        User.get(withId: "FGs95FZ5UN") {
//            (object) in
//            if let user = object {
//                print(user)
//                print(user["name"])
//            }
//        }
        
//        User.get(withId: "FGs95FZ5UN") {
//            (object) in
//            if let user = object {
//                user["name"] = "Michelle"
//                ParseContext.save(object: user)
//            }
//        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if parseContext.isUserLoggedIn() {
            performSegue(withIdentifier: "showUserTable", sender: self)
        } else {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    

    func ignoreEvents() {
        activityIndicator = UIActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    
    @IBAction func buttonSignUpOrLoginTapped(_ sender: UIButton) {
        if textFieldEmail.text == "" || textFieldPassword.text == "" {
            Alerter.create(
                controller: self,
                title: "Error in form",
                message: "Please enter an email and password")
        } else {
            ignoreEvents()
            if signUpMode {
                signUp()
            } else {
                login()
            }
        }
    }
    
    func signUp() {
        parseContext.signUp(
            email: textFieldEmail.text!,
            password: textFieldPassword.text!,
            precomplete: {(success, error) in
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
            },
            onerror: {(message) in
                Alerter.create(controller: self,
                               title: "Signup Error",
                               message: message)
            },
            onsuccess: {() in
                self.performSegue(withIdentifier: "showUserTable", sender: self)
            }
            
        )
    }
    
    func login() {
        parseContext.login(
            email: textFieldEmail.text!,
            password: textFieldPassword.text!,
            precomplete: {
                (user, error) in
                self.activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
            },
            onerror: {
                (message) in
                Alerter.create(controller: self,
                               title: "Login Error",
                               message: message)
            },
            onsuccess: {
                () in
                self.performSegue(withIdentifier: "showUserTable", sender: self)
            })
    }
    
    @IBAction func buttonChangeSignUpModeTapped(_ sender: UIButton) {
        if signUpMode {
            changeToLoginMode()
        } else {
            changeToSignUpMode()
        }
        signUpMode = !signUpMode
    }

    func changeToSignUpMode() {
        buttonSignUpOrLogin.setTitle("Sign Up", for: [])
        buttonChangeSignUpMode.setTitle("Log In", for: [])
        labelMessage.text = "Already have an account?"
    }
    
    func changeToLoginMode() {
        buttonSignUpOrLogin.setTitle("Log In", for: [])
        buttonChangeSignUpMode.setTitle("Sign Up", for: [])
        labelMessage.text = "Don't have an account?"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserTable",
            let navVC = segue.destination as? UINavigationController,
            let userTablesVC = navVC.childViewControllers[0] as? UserTableViewController {
            userTablesVC.parseContext = self.parseContext
        }
    }
    
}

