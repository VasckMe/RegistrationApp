//
//  SignInViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var wrongEmailLbl: UILabel!
    @IBOutlet private var passTextField: UITextField!
    @IBOutlet private var wrongPassLbl: UILabel!
    @IBOutlet private var showPassLbl: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func checkEmail() {
        showError(showEmailError: false, showPassError: nil)
    }
    @IBAction func checkPassword() {
        showError(showEmailError: nil, showPassError: false)
    }

    @IBAction func showPassButton() {
        switch passTextField.isSecureTextEntry {
            case true:
                showPassLbl.setTitle("hide password", for: .normal)
                passTextField.isSecureTextEntry.toggle()
            case false:
                showPassLbl.setTitle("show password", for: .normal)
                passTextField.isSecureTextEntry.toggle()
        }
    }

    @IBAction func signInButton() {
        for acc in accountsData {
            if acc.email != emailTextField.text {
                showError(showEmailError: true, showPassError: true)
            } else if acc.password != passTextField.text {
                showError(showEmailError: false, showPassError: true)
            } else { /*signing in*/}
        }
    }
    
    //MARK: Functions
    private func showError(showEmailError email: Bool!, showPassError password: Bool!) {
        if let emailBool = email { wrongEmailLbl.isHidden = !emailBool}
        if let passBool = password { wrongPassLbl.isHidden = !passBool}
    }
}
