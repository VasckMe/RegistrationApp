//
//  ProfileViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 3.08.22.
//

import UIKit

class ProfileViewController: MainViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUsersProfile()
    }
    
    private func setUpUsersProfile() {
        nameLbl.text = userModel?.name
        emailLbl.text = userModel?.email
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
