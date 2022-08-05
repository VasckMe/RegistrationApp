//
//  WelcomeViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBAction func continueButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
