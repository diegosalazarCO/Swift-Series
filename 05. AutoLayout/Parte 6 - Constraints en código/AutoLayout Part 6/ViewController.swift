//
//  ViewController.swift
//  AutoLayout Part 6
//
//  Created by Diego Salazar on 1/9/16.
//  Copyright © 2016 Diego Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = UIView()
        loginView.translatesAutoresizingMaskIntoConstraints  = false
        loginView.backgroundColor = UIColor.brownColor()
        view.addSubview(loginView)
        
        
        let userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = "User"
        userLabel.textColor = UIColor.whiteColor()
        loginView.addSubview(userLabel)
        
        let passLabel = UILabel()
        passLabel.translatesAutoresizingMaskIntoConstraints = false
        passLabel.text = "Password"
        passLabel.textColor = UIColor.whiteColor()
        loginView.addSubview(passLabel)
        
        let userTextField = UITextField()
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.text = "Elon Musk"
        userTextField.borderStyle = .RoundedRect
        loginView.addSubview(userTextField)
        
        let passTextField = UITextField()
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.text = "12345"
        passTextField.secureTextEntry = true
        passTextField.borderStyle = .RoundedRect
        loginView.addSubview(passTextField)
        
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        loginView.addSubview(loginButton)
        
        // MARK: Login View Contraints
        NSLayoutConstraint(item: loginView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.0, constant: 200.0).active = true
        NSLayoutConstraint(item: loginView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.9, constant: 0.0).active = true
        NSLayoutConstraint(item: loginView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: loginView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        // MARK: Components Contraints
        //
        // Label 1
        NSLayoutConstraint(item: userLabel, attribute: .Leading, relatedBy: .Equal, toItem: loginView, attribute: .LeadingMargin, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: userLabel, attribute: .Top, relatedBy: .Equal, toItem: loginView, attribute: .TopMargin, multiplier: 1.0, constant: 20.0).active = true
        // Label 2
        NSLayoutConstraint(item: passLabel, attribute: .Leading, relatedBy: .Equal, toItem: userLabel, attribute: .Leading, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: passLabel, attribute: .Top, relatedBy: .Equal, toItem: userLabel, attribute: .Bottom, multiplier: 1.0, constant: 28.0).active = true
        // TextField 1
        NSLayoutConstraint(item: userTextField, attribute: .Trailing, relatedBy: .Equal, toItem: loginView, attribute: .TrailingMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: userTextField, attribute: .Baseline, relatedBy: .Equal, toItem: userLabel, attribute: .Baseline, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: userTextField, attribute: .Left, relatedBy: .LessThanOrEqual, toItem: userLabel, attribute: .Right, multiplier: 1.0, constant: 30.0).active = true
        // TextField 2
        NSLayoutConstraint(item: passTextField, attribute: .Trailing, relatedBy: .Equal, toItem: userTextField, attribute: .Trailing, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: passTextField, attribute: .Baseline, relatedBy: .Equal, toItem: passLabel, attribute: .Baseline, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: passTextField, attribute: .Left, relatedBy: .LessThanOrEqual, toItem: passLabel, attribute: .Right, multiplier: 1.0, constant: 30.0).active = true
        NSLayoutConstraint(item: passTextField, attribute: .Width, relatedBy: .Equal, toItem: userTextField, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        // Button
        NSLayoutConstraint(item: loginButton, attribute: .Bottom, relatedBy: .Equal, toItem: loginView, attribute: .BottomMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: loginButton, attribute: .CenterX, relatedBy: .Equal, toItem: loginView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

