//
//  SignUpViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var wrongEmailLbl: UILabel!
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var wrongPassLbl: UILabel!
    @IBOutlet private weak var confirmPassTF: UITextField!
    @IBOutlet private weak var wrongConfirmPassLbl: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet var viewLights: [UIView]!
    
    // MARK: Private properties
    private let isOn: CGFloat = 1
    private let isOff: CGFloat = 0.3
    private var isValidEmail = false {
        didSet {
            updateSignUpButton()
        }
    }
    private var passwordStrength: PasswordStrength = .veryWeak {
        didSet {
            updateSignUpButton()
        }
    }
    private var isValidConfirmedPass = false {
        didSet {
            updateSignUpButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    //MARK: IBActions
    @IBAction private func emailCheck() {
        if let email = emailTF.text,
           !email.isEmpty {
            isValidEmail = VerificationService.isValidEmailAddress(emailAddressString: email)
        }
        wrongEmailLbl.isHidden = isValidEmail
    }

    @IBAction private func passCheck() {
        if let password = passwordTF.text,
           !password.isEmpty {
            passwordStrength = VerificationService.isValidPassword(password: password)
            setUpViewsLights(difficult: passwordStrength)
        }
        wrongPassLbl.isHidden = passwordStrength != .veryWeak
    }

    @IBAction private func showPasswordButton(_ sender: UIButton) {
        switch passwordTF.isSecureTextEntry {
        case true:
            sender.setTitle("hide password", for: .normal)
            passwordTF.isSecureTextEntry.toggle()
        case false:
            sender.setTitle("show password", for: .normal)
            passwordTF.isSecureTextEntry.toggle()
        }
    }
    
    @IBAction private func confirmPassCheck() {
        if let password = passwordTF.text,
           let confPassword = confirmPassTF.text {
            isValidConfirmedPass = VerificationService.isPasswordConfirm(password: password, confirmedPassword: confPassword)
        }
        wrongConfirmPassLbl.isHidden = isValidConfirmedPass
    }
    
    @IBAction private func signIn() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func signUp() {
        if
            let email = emailTF.text,
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
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    //MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let verifyVC = segue.destination as? VerifycationViewController,
           let user = sender as? UserModel,
           segue.identifier == "GoToVerifyVC" {
            verifyVC.userModel = user
        }
    }
}
