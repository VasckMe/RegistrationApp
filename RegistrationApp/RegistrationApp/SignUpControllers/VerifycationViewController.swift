//
//  VerifycationViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class VerifycationViewController: UIViewController {
    // MARK: IBOutlets

    @IBOutlet private var codeTextField: UITextField!
    @IBOutlet private var wrongCodeLabel: UILabel!
    @IBOutlet private var helpLabel: UILabel!

    // MARK: Properties

    var userModel: UserModel?
    var code = Int.random(in: 100000 ... 999999)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpLabel()
    }

    // MARK: IBActions

    @IBAction private func codeCheck() {
        if
            let codeText = codeTextField.text,
            let codeInt = Int(codeText),
            let user = userModel,
            codeInt == code
        {
            UserDefaultsService.saveUserModel(userModel: user)
            performSegue(withIdentifier: "GoToWelcomeVC", sender: nil)
        }
        wrongCodeLabel.isHidden = codeTextField.text?.count ?? 0 >= 6 ? false : true
    }

    // MARK: Functions

    private func setupHelpLabel() {
        let name = userModel?.name ?? "user"
        let email = userModel?.email ?? "mail"
        helpLabel.text = "Hello \(name) sent you special code \(code) on your email \(email)"
    }
}
