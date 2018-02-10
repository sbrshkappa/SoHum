//
//  RegisterViewController.swift
//  So Hum
//
//  Created by Sabareesh Kappagantu on 1/30/18.
//  Copyright © 2018 Sabareesh Kappagantu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var inputContainerView: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpContainer: UIView!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginContainer: UIView!
    
    @IBOutlet weak var viewSwitcher: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputContainerView.layer.cornerRadius = 5
        inputContainerView.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }
    
    //Switch Views based o nthe Segmeneted Control
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        switch viewSwitcher.selectedSegmentIndex {
            case 0:
                signUpContainer.isHidden = false
                loginContainer.isHidden = true
                break;
            case 1:
                signUpContainer.isHidden = true
                loginContainer.isHidden = false
                break;
            default:
                break;
            
        }
    }
    
    //Setting the status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle {return .lightContent}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
