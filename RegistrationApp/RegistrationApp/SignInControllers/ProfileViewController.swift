//
//  ProfileViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 3.08.22.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUsersProfile()
    }
    
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
    
    // MARK: Functions
    
    private func setUpUsersProfile() {
        if
            let user = UserDefaultsService.getUserModel()
        {
            nameLabel.text = user.name
            emailLabel.text = user.email
        }
    }
}
