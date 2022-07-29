//
//  SignUpViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak private var emailTF: UITextField!
    @IBOutlet weak private var nameTF: UITextField!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak private var confirmPassTF: UITextField!
    
    @IBOutlet weak private var passRedView: UIView!
    @IBOutlet weak private var passOrangeView: UIView!
    @IBOutlet weak private var passYellowView: UIView!
    @IBOutlet weak private var passGreenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func emailCheck() {
    }
    
    @IBAction func passCheck() {
    }
    
    @IBAction func confirmPassCheck() {
    }
}
