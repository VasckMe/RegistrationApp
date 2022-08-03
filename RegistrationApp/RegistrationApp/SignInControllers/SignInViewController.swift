//
//  SignInViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var wrongEmailLbl: UILabel!
    @IBOutlet private var passTextField: UITextField!
    @IBOutlet private var wrongPassLbl: UILabel!
    @IBOutlet private var showPassLbl: UIButton!
    @IBOutlet private weak var signInButtonOutlet: UIButton!
    
    
    //MARK: Private properties
    private var isValidPassword = false { didSet {isValidateUser()}}
    private var isValidEmail = false { didSet {isValidateUser()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let account = UserModel(email: "1@1.com", name: "popa", password: "qwerty123")
        usersDatabase.append(account)
    }

    //MARK: IBActions
    @IBAction func checkEmail() {
        if let email = emailTextField.text,
           !email.isEmpty {
            isValidEmail = VerificationService.isValidEmailAddress(emailAddressString: email)
        }
        wrongEmailLbl.isHidden = isValidEmail
    }
    @IBAction func checkPassword() {
        if let password = passTextField.text,
           !password.isEmpty,
            let email = emailTextField.text,
               !email.isEmpty {
            usersDatabase.enumerated().forEach { (index, user) in
                if user.email == email, user.password == password {
                    isValidPassword = true
                } else { isValidPassword = false }
            }
        }
        wrongPassLbl.isHidden = isValidPassword
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarViewController else { return }
        if let views = tabBarVC.viewControllers,
           let profileVC = views[1] as? ProfileViewController,
           let index = indexOfUser() {
            profileVC.userModel = usersDatabase[index]
        }
        navigationController?.pushViewController(tabBarVC, animated: true)
    }
    
    
    @IBAction func unwindToRoot(_ unwindSegue: UIStoryboardSegue) {
        let _ = unwindSegue.source
    }
    
    //MARK: Functions
    private func isValidateUser() {
        signInButtonOutlet.isEnabled = isValidPassword && isValidEmail
    }
    private func indexOfUser() -> Int? {
        for (id, user) in usersDatabase.enumerated() {
            if let email = emailTextField.text,
               user.email == email,
               let password = passTextField.text,
               user.password == password {
                return id
            }
        }
        return nil
    }
}
