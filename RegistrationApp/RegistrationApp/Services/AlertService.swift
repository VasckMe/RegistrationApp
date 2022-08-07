//
//  AlertService.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 7.08.22.
//

import Foundation
import UIKit

final class AlertService {
    static func logoutAction(view: UIViewController,
                             title: String,
                             message: String,
                             style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let confirmAction = UIAlertAction(title: "confirm", style: .default) {_ in
            view.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        view.present(alert, animated: true)
    }
    static func deleteAction(view: UIViewController,
                             title: String,
                             message: String,
                             style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let confirmAction = UIAlertAction(title: "confirm", style: .default) {_ in
            UserDefaults.standard.reset()
            view.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        view.present(alert, animated: true)
    }
}
