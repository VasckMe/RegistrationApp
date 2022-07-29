//
//  Account.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 29.07.22.
//

import Foundation

struct Account {
    let email: String
    let name: String?
    let password: String
    
    init(email: String, name: String?, password: String) {
        self.email = email
        self.name = name ?? "unknown"
        self.password = password
    }
}
