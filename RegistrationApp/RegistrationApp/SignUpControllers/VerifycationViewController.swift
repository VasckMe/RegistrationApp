//
//  VerifycationViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

class VerifycationViewController: UIViewController {

    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var helpLbl: UILabel!
    
    var accountData: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func codeCheck() {
        if codeTF.text == "1" {
            performSegue(withIdentifier: "GoToWelcomeVC", sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
