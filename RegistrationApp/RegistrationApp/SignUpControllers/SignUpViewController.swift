//
//  SignUpViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var passRedView: UIView!
    @IBOutlet weak var passOrangeView: UIView!
    @IBOutlet weak var passYellowView: UIView!
    @IBOutlet weak var passGreenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func passCheck(_ sender: Any) {
    }
    
    @IBAction func confirmPassCheck(_ sender: Any) {
    }
}
