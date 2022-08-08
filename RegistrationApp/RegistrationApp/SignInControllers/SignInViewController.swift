//
//  SignInViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var wrongEmailLabel: UILabel!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var wrongPassLabel: UILabel!
    @IBOutlet private weak var showPassLabel: UIButton!
    @IBOutlet private weak var signInButtonOutlet: UIButton!
    
    //MARK: Private properties
    private var isValidPassword = false {
        didSet {
            isValidateUser()
        }
    }

    private var isValidEmail = false {
        didSet {
            isValidateUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isUserLogged()
    }

    //MARK: IBActions
    @IBAction private func checkEmail() {
        if
            let email = emailTextField.text,
            !email.isEmpty
        {
            isValidEmail = VerificationService.isValidEmailAddress(emailAddressString: email)
        }
        wrongEmailLabel.isHidden = isValidEmail
    }
    @IBAction private func checkPassword() {
        guard
            let password = passTextField.text,
            !password.isEmpty,
            let email = emailTextField.text,
            !email.isEmpty
        else {
            return
        }
            if
                let user = UserDefaultsService.getUserModel(),
                user.password == password,
                user.email == email
            {
                isValidPassword = true
            } else {
                isValidPassword = false
            }
        wrongPassLabel.isHidden = isValidPassword
    }

    @IBAction private func showPassButton() {
        if
            passTextField.isSecureTextEntry
        {
            showPassLabel.setTitle("hide password", for: .normal)
            passTextField.isSecureTextEntry.toggle()
        } else {
            showPassLabel.setTitle("show password", for: .normal)
            passTextField.isSecureTextEntry.toggle()
        }
    }

    @IBAction private func signInButton() {
        performSegue(withIdentifier: "GoToMainVC", sender: nil)
    }
    
    //MARK: Functions
    private func isValidateUser() {
        signInButtonOutlet.isEnabled = isValidPassword && isValidEmail
    }
    
    private func isUserLogged() {
        let user = UserDefaultsService.getUserModel()
        print(user)
        if UserDefaultsService.getUserModel() != nil {
            performSegue(withIdentifier: "GoToMainVC", sender: nil)
        }
    }
}

