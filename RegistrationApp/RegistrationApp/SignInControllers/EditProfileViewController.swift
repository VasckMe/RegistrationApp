//
//  EditProfileViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 6.08.22.
//

import UIKit

class EditProfileViewController: UITabBarController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailWrongLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    @IBOutlet weak var confirmedPassTextField: UITextField!
    @IBOutlet weak var wrongConfPassLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUserData()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
    }
    
    private func fillUserData() {

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
