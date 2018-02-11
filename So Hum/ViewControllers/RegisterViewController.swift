//
//  RegisterViewController.swift
//  So Hum
//
//  Created by Sabareesh Kappagantu on 1/30/18.
//  Copyright © 2018 Sabareesh Kappagantu. All rights reserved.
//

import UIKit
import FirebaseAuth

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
    
    @IBAction func onSignUp(_ sender: Any) {
        if emailField.text == "" || nameField.text == "" || passwordField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please Enter your Email, Password and Name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            //Calling Firebase API to SignUp the User
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if error == nil {
                    print("The user has successfully signed up.")
                    
                    //Redirect User to Setup Page
                    self.performSegue(withIdentifier: "setupAccountSegue", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setupAccountSegue" {
            let vc = segue.destination as! SetupViewController
            vc.userName = nameField.text
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
