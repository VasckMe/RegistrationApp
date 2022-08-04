//
//  ProfileViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 3.08.22.
//

import UIKit

final class ProfileViewController: UIViewController {

    var userModel: UserModel?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUsersProfile()
        print("view did load")
    }
    
    private func setUpUsersProfile() {
        nameLabel.text = userModel?.name
        emailLabel.text = userModel?.email
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
