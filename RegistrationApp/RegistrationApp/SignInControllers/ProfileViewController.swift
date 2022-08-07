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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUsersProfile()
    }

    // MARK: IBActions
    @IBAction func logoutButton() {
        let confirmAction = UIAlertAction(title: "confirm", style: .default) {_ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertService(title: "Warning", message: "Are you sure to logout?", style: .alert, confirmAction: confirmAction)
    }
    @IBAction func deleteButton() {
        let confirmAction = UIAlertAction(title: "confirm", style: .default) { _ in
            UserDefaults.standard.reset()
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertService(title: "Warning", message: "Are you to delete this account?", style: .alert, confirmAction: confirmAction)
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
    
    private func alertService(title: String,
                              message: String,
                              style: UIAlertController.Style,
                              confirmAction: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true)
    }
}
