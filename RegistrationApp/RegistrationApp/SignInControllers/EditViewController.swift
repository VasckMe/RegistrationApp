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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUserData()
    }
    
    // MARK: IBActions
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
}
