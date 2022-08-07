//
//  EditViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 7.08.22.
//

import UIKit

class EditViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var nameTextField: UITextField!
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var wrongEmailLabel: UILabel!
    
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var wrongPasswordLabel: UILabel!
    
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var wrongConfPassLabel: UILabel!
    
    @IBOutlet private weak var saveButtonOutlet: UIButton!
    
    // MARK: Properties
    
    private var isValidEmail = true {
        didSet {
            checkEditedUser()
        }
    }
    private var isValidPassword = PasswordStrength.weak {
        didSet {
            checkEditedUser()
        }
    }
    private var isValidConfPassword = true {
        didSet {
            checkEditedUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUserData()
    }
    
    // MARK: IBActions
    
    @IBAction func nameAction() {
        checkEditedUser()
    }
    
    @IBAction func emailAction() {
        if
            let email = emailTextField.text,
            !email.isEmpty
        {
            isValidEmail = VerificationService.isValidEmailAddress(emailAddressString: email)
        }
        wrongEmailLabel.isHidden = isValidEmail
    }
    
    @IBAction func passwordAction() {
        if
            let password = passwordTextField.text,
            !password.isEmpty
        {
            isValidPassword = VerificationService.isValidPassword(password: password)
        }
        wrongPasswordLabel.isHidden = isValidPassword != .veryWeak
    }
    
    @IBAction func confPasswordAction() {
        if
            let confPass = confirmPasswordTextField.text,
            !confPass.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty
        {
            isValidConfPassword = VerificationService.isPasswordConfirm(password: password, confirmedPassword: confPass)
        }
        wrongConfPassLabel.isHidden = isValidConfPassword
    }
    
    
    
    
    
    @IBAction private func showPasswordButton(_ sender: UIButton) {
        if
            passwordTextField.isSecureTextEntry,
            confirmPasswordTextField.isSecureTextEntry
        {
            sender.setTitle("hide password", for: .normal)
            passwordTextField.isSecureTextEntry.toggle()
            confirmPasswordTextField.isSecureTextEntry.toggle()
        } else {
            sender.setTitle("show password", for: .normal)
            passwordTextField.isSecureTextEntry.toggle()
            confirmPasswordTextField.isSecureTextEntry.toggle()
        }
    }
    
    @IBAction private func saveButtonAction() {
        UserDefaults.standard.reset()
        let editedUser = UserModel(email: emailTextField.text!,
                                   name: nameTextField.text,
                                   password: passwordTextField.text!)
        UserDefaultsService.saveUserModel(userModel: editedUser)
        navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: Functions
    private func fillUserData() {
        if
            let user = UserDefaultsService.getUserModel()
        {
            nameTextField.text = user.name
            emailTextField.text = user.email
            passwordTextField.text = user.password
            confirmPasswordTextField.text = user.password
        }
    }
    private func checkEditedUser() {
        
        let user = UserDefaultsService.getUserModel()
        let editedUser = UserModel(email: emailTextField.text!,
                                   name: nameTextField.text,
                                   password: passwordTextField.text!)
        if
            isValidEmail,
            isValidConfPassword,
            isValidPassword != .veryWeak,
            editedUser != user
        {
            saveButtonOutlet.isEnabled = true
        } else {
            saveButtonOutlet.isEnabled = false
        }
    }
}
