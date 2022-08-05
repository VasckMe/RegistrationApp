//
//  VerifycationViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class VerifycationViewController: UIViewController {
    @IBOutlet private weak var codeTextField: UITextField!
    @IBOutlet private weak var wrongCodeLabel: UILabel!
    @IBOutlet private weak var helpLabel: UILabel!
    
    var userModel: UserModel?
    var code = Int.random(in: 100000...999999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpLabel()
    }
    
    @IBAction private func codeCheck() {
        
        if
            let codeText = codeTextField.text,
            let codeInt = Int(codeText),
            let user = userModel,
            codeInt == code
        {
                usersDatabase.append(user)
                performSegue(withIdentifier: "GoToWelcomeVC", sender: nil)
        }
        wrongCodeLabel.isHidden = codeTextField.text?.count ?? 0 >= 6 ? false : true
    }
    
    private func setupHelpLabel() {
        let name = userModel?.name ?? "user"
        let email = userModel?.email ?? "mail"
        helpLabel.text = "Hello \(name) sent you special code \(code) on your email \(email)"
    }
}
