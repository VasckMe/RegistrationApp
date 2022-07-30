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
    
    @IBOutlet private var passRedView: UIView!
    @IBOutlet private var passOrangeView: UIView!
    @IBOutlet private var passYellowView: UIView!
    @IBOutlet private var passGreenView: UIView!
    
    private let isOn: CGFloat = 1
    private let isOff: CGFloat = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()
        clearPasswordLight()
    }
    //MARK: IBActions
    @IBAction func emailCheck() {
        wrongEmailLbl.isHidden = true
        if !isValidEmailAddress(emailAddressString: emailTF.text) {
            wrongEmailLbl.isHidden = false
        }
    }

    @IBAction func passCheck() {
        wrongPassLbl.isHidden = true
        if !isValidPassword(password: passwordTF.text) {
            wrongPassLbl.isHidden = false
        }
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
        wrongConfirmPassLbl.isHidden = true
        if !isValidConfirmedPassword(confirmedPassword: confirmPassTF.text) {
            wrongConfirmPassLbl.isHidden = false
        }
    }
    
    @IBAction func signIn() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUp() {
        if isValidEmailAddress(emailAddressString: emailTF.text),
           isValidPassword(password: passwordTF.text),
           isValidConfirmedPassword(confirmedPassword: confirmPassTF.text)
        {
            let account = Account(email: emailTF.text!, name: nameTF.text, password: passwordTF.text!)
            performSegue(withIdentifier: "GoToVerifyVC", sender: account)
        } else {
            emailCheck()
            passCheck()
            confirmPassCheck()
        }
    }
    
    //MARK: Private functions
    private func isValidEmailAddress(emailAddressString: String?) -> Bool {
        let emailAddress = emailAddressString ?? ""
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddress as NSString
            let results = regex.matches(in: emailAddress, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    
    private func isValidPassword(password: String?) -> Bool {
        let difficult = checkPasswordDifficult(password: password ?? "")
        
        clearPasswordLight()
        switch difficult {
        case .difficult:
            passGreenView.alpha = isOn
            fallthrough
        case .medium:
            passYellowView.alpha = isOn
            fallthrough
        case .easy:
            passOrangeView.alpha = isOn
            fallthrough
        case .veryEasy:
            passRedView.alpha = isOn
        case .clear:
            clearPasswordLight()
        }
        switch difficult {
        case .clear:
            wrongPassLbl.isHidden = false
            return false
        case .veryEasy:
            wrongPassLbl.isHidden = false
            return false
        case .easy:
            wrongPassLbl.isHidden = true
            return true
        case .medium:
            return true
        case .difficult:
            return true
        }
    }

    private func isValidConfirmedPassword(confirmedPassword: String?) -> Bool {
        let confPassword = confirmedPassword ?? ""
        if confPassword == passwordTF.text,
           confPassword != ""
        {
            return true
        } else { return false }
    }
    
    private func checkPasswordDifficult(password: String) -> PasswordDifficulty {
        var difficult: PasswordDifficulty
        
        switch password {
        case _ where password.count >= 8 && password.contains(where: { char in
            char.isLowercase
        }) && password.contains(where: { char in
            char.isUppercase
        }) && password.contains(where: { char in
            char.isNumber
        }):
            difficult = .difficult
        case _ where password.count >= 8 && password.contains(where: { char in
            char.isLowercase
        }) && password.contains(where: { char in
            char.isUppercase
        }):
            difficult = .medium
        case _ where password.count >= 8:
            difficult = .easy
        case _ where password.count >= 1:
            difficult = .veryEasy
        default:
            difficult = .clear
        }
        return difficult
    }

    private func clearPasswordLight() {
        passRedView.alpha = isOff
        passOrangeView.alpha = isOff
        passYellowView.alpha = isOff
        passGreenView.alpha = isOff
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let verifyVC = segue.destination as? VerifycationViewController,
           let account = sender as? Account,
           segue.identifier == "GoToVerifyVC" {
            verifyVC.accountData = account
        }
    }
    
}
