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
    
    var qqq: String?
    
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
        let account = UserModel(email: "1@1.com", name: "popa", password: "qwerty123")
        usersDatabase.append(account)
        if let q = qqq,
           !q.isEmpty {
            print("empty")
        } else {
            print("not empty")
        }
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
        usersDatabase.enumerated().forEach { _, user in
            if
                user.email == email, user.password == password
            {
                isValidPassword = true
            } else {
                isValidPassword = false
            }
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard
            let tabBarVC = storyboard.instantiateViewController(withIdentifier:
                "TabBarVC") as? TabBarViewController
        else {
            return
        }
        
        if
            let views = tabBarVC.viewControllers,
            let index = indexOfUser()
        {
            let user = usersDatabase[index]
            for view in views {
                if let mainVC = view as? MainViewController {
                    mainVC.userModel = user
                } else if let profileVC = view as? ProfileViewController {
                    profileVC.userModel = user
                }
            }
        }
        navigationController?.pushViewController(tabBarVC, animated: true)
    }
    
    //MARK: Functions
    private func isValidateUser() {
        signInButtonOutlet.isEnabled = isValidPassword && isValidEmail
    }
    private func indexOfUser() -> Int? {
        for (id, user) in usersDatabase.enumerated() {
            if
                let email = emailTextField.text,
                user.email == email,
                let password = passTextField.text,
                user.password == password
            {
                return id
            }
        }
        return nil
    }
}

