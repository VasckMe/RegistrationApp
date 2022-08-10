//
//  ProfileViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 3.08.22.
//

import UIKit

protocol EditingUserData {
    func fetchUserData(userModel: UserModel)
}

final class ProfileViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUsersProfile()
    }

    // MARK: IBActions
    @IBAction func logoutButton() {
        AlertService.logoutAction(view: self,
                                  title: "Warning!",
                                  message: "Are you sure to logout?",
                                  style: .alert)
    }
    @IBAction func deleteButton() {
        AlertService.deleteAction(view: self,
                                  title: "Warning",
                                  message: "Are you to delete this account?",
                                  style: .alert)
    }
    @IBAction func editButtonAction() {
        performSegue(withIdentifier: "GoToEditVC", sender: nil)
    }
    
    // MARK: Functions
    
    private func setUpUsersProfile() {
        if
            let user = UserDefaultsService.getUserModel()
        {
            nameLabel.text = user.name
            emailLabel.text = user.email
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editVC = segue.destination as? EditViewController,
           segue.identifier == "GoToEditVC" {
            editVC.delegate = self
        }
    }
    
}

extension ProfileViewController: EditingUserData {
    func fetchUserData(userModel: UserModel) {
        nameLabel.text = userModel.name
        emailLabel.text = userModel.email
    }
    
    
}
