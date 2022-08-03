//
//  TabBarViewController.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 3.08.22.
//

import UIKit

class TabBarViewController: UITabBarController {

    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        // Do any additional setup after loading the view.
    }
    
    func test() {
        if let views = tabBarController?.viewControllers,
           let profileVC = views[1] as? ProfileViewController {
            profileVC.userModel = userModel
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