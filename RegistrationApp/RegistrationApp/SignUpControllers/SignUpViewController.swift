//
//  SignUpViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak private var emailTF: UITextField!
    @IBOutlet weak private var nameTF: UITextField!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak private var confirmPassTF: UITextField!
    
    @IBOutlet weak private var passRedView: UIView!
    @IBOutlet weak private var passOrangeView: UIView!
    @IBOutlet weak private var passYellowView: UIView!
    @IBOutlet weak private var passGreenView: UIView!
    
    private let isOn: CGFloat = 1
    private let isOff: CGFloat = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()
        clearPasswordLight()
    }
    @IBAction func emailCheck() {
    }
    

    @IBAction func passCheck() {
        showPasswordDifficult(password: passwordTF.text)
    }
    
    @IBAction func confirmPassCheck() {
//        if passwordTF.text == confirmPassTF.text,
//           passwordTF.text != nil
    }
    
    private func showPasswordDifficult(password: String?) {
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
}
