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

    @IBOutlet weak var signInButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func checkEmail() {
        showError(showEmailError: false, showPassError: nil)
        if isValidateUser() {
            signInButtonOutlet.isEnabled = true
        } else {
            signInButtonOutlet.isEnabled = false
        }
    }
    @IBAction func checkPassword() {
        showError(showEmailError: nil, showPassError: false)
        if isValidateUser() {
            signInButtonOutlet.isEnabled = true
        } else {
            signInButtonOutlet.isEnabled = false
        }
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
//        for acc in accountsDatabase {
//            if acc.email != emailTextField.text {
//                showError(showEmailError: true, showPassError: true)
//            } else if acc.password != passTextField.text {
//                showError(showEmailError: false, showPassError: true)
//            } else { /*signing in*/}
//        }
    }
    
    
    @IBAction func unwindToRoot(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    //MARK: Functions
    private func showError(showEmailError email: Bool!, showPassError password: Bool!) {
        if let emailBool = email { wrongEmailLbl.isHidden = !emailBool}
        if let passBool = password { wrongPassLbl.isHidden = !passBool}
    }
    
    private func isValidateUser() -> Bool {
        for acc in accountsDatabase {
            if acc.email != emailTextField.text {
                showError(showEmailError: true, showPassError: true)
                return false
            } else if acc.password != passTextField.text {
                showError(showEmailError: false, showPassError: true)
                return false
            } else {
                showError(showEmailError: false, showPassError: false)
                return true
                
            }
        }
        return false
    }
}
