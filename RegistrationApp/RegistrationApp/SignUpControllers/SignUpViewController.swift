//
//  SignUpViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private var emailTF: UITextField!
    @IBOutlet private var wrongEmailLbl: UILabel!
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    @IBOutlet private var wrongPassLbl: UILabel!
    @IBOutlet private var confirmPassTF: UITextField!
    @IBOutlet private var wrongConfirmPassLbl: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet var viewLights: [UIView]!
    
    // MARK: Private properties
    private let isOn: CGFloat = 1
    private let isOff: CGFloat = 0.3
    private var isValidEmail = false { didSet { updateSignUpButton() } }
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateSignUpButton() } }
    private var isValidConfirmedPass = false { didSet { updateSignUpButton() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func emailCheck() {
        if let email = emailTF.text,
           !email.isEmpty {
            isValidEmail = VerificationService.isValidEmailAddress(emailAddressString: email)
        }
        wrongEmailLbl.isHidden = isValidEmail
    }

    @IBAction func passCheck() {
        if let password = passwordTF.text,
           !password.isEmpty {
            passwordStrength = VerificationService.isValidPassword(password: password)
            setUpViewsLights(difficult: passwordStrength)
        }
        wrongPassLbl.isHidden = passwordStrength != .veryWeak
    }

    @IBAction func showPasswordButton(_ sender: UIButton) {
        switch passwordTF.isSecureTextEntry {
        case true:
            sender.setTitle("hide password", for: .normal)
            passwordTF.isSecureTextEntry.toggle()
        case false:
            sender.setTitle("show password", for: .normal)
            passwordTF.isSecureTextEntry.toggle()
        }
    }
    
    @IBAction func confirmPassCheck() {
        if let password = passwordTF.text,
           let confPassword = confirmPassTF.text {
            isValidConfirmedPass = VerificationService.isPasswordConfirm(password: password, confirmedPassword: confPassword)
        }
        wrongConfirmPassLbl.isHidden = isValidConfirmedPass
    }
    
    @IBAction func signIn() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUp() {
        if let email = emailTF.text,
           !email.isEmpty,
           let password = passwordTF.text,
           !password.isEmpty
        {
            let user = UserModel(email: email, name: nameTF.text, password: password)
            performSegue(withIdentifier: "GoToVerifyVC", sender: user)
        }
    }
    
    //MARK: Private functions
    private func updateSignUpButton() {
        signUpButton.isEnabled = isValidEmail && isValidConfirmedPass && passwordStrength !=
            .veryWeak
    }
        
    private func setUpViewsLights(difficult stage: PasswordStrength) {
        for (index, view) in viewLights.enumerated() {
            if index <= passwordStrength.rawValue - 1 {
                view.alpha = 1.0
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let verifyVC = segue.destination as? VerifycationViewController,
           let user = sender as? UserModel,
           segue.identifier == "GoToVerifyVC" {
            verifyVC.accountData = user
        }
    }
}
