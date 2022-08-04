//
//  VerificationService.swift
//  RegistrationApp
//
//  Created by Apple Macbook Pro 13 on 2.08.22.
//

import Foundation

final class VerificationService {
    static let weakRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    static let notVeryWeakRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    static let notVeryStrongRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    static let strongRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    
    static func isValidEmailAddress(emailAddressString: String?) -> Bool {
        let emailAddress = emailAddressString ?? ""
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddress as NSString
            let results = regex.matches(in: emailAddress, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return returnValue
    }
    
    static func isValidPassword(password: String) -> PasswordStrength {
        if NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: password) {
            return .strong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex).evaluate(with: password) {
            return .notVeryStrong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex).evaluate(with: password) {
            return .notVeryWeak
        } else if NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: password) {
            return .weak
        } else {
            return .veryWeak
        }
    }
        
    static func isPasswordConfirm(password: String, confirmedPassword: String) -> Bool {
        password == confirmedPassword
    }
}
