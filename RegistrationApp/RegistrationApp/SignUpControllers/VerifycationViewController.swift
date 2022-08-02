//
//  VerifycationViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class VerifycationViewController: UIViewController {
    @IBOutlet var codeTF: UITextField!
    @IBOutlet var helpLbl: UILabel!
    
    var accountData: UserModel?
    var code: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        code = createCode()
        helpLbl.text = "We sent you special code \(code!) on your email \(accountData?.email ?? "(error email)")"
    }
    
    @IBAction func codeCheck() {
        if codeTF.text == code {
            guard let account = accountData else {
                return
            }
            usersDatabase.append(account)
            performSegue(withIdentifier: "GoToWelcomeVC", sender: nil)
        }
    }
    
    private func createCode() -> String {
        var code = ""
        
        for _ in 1...5 {
            let randomInt = Int.random(in: 1...9)
            code.append(String(randomInt))
        }
        
        return code
    }
}
