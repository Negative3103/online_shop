//
//  KeychainAccess.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import KeychainAccess
import UIKit

enum KeychainKeys: String {
    case email
    case password
    case accountNumber
    case balance
    case name
    case login
}

final class KeychainAccessCheck: NSObject {
    
    static let keychain = Keychain(service: MainConstants.service.rawValue)
    
    class func isAuthed() -> Bool {
        return login() != nil ? true : false
    }
    
    class func login() -> String? {
        do {
            return try keychain.get(KeychainKeys.login.rawValue)
        } catch let error {
            print("error: \(error)")
            return nil
        }
    }
    
    class func savelogin(login: String) {
        do {
            try keychain.set(login, key: KeychainKeys.login.rawValue)
        }
        catch let error {
            print("error: \(error)")
        }
    }
    
    class func saveAccountNumber(accountNumber: String) {
        do {
            try keychain.set(accountNumber, key: KeychainKeys.accountNumber.rawValue)
        }
        catch let error {
            print("error: \(error)")
        }
    }
    
    class func accountNumber() -> String? {
        do {
            return try keychain.get(KeychainKeys.accountNumber.rawValue)
        } catch let error {
            print("error: \(error)")
            return nil
        }
    }

    class func saveEmail(email: String) {
        do {
            try keychain.set(email, key: KeychainKeys.email.rawValue)
        }
        catch let error {
            print("error: \(error)")
        }
    }
    
    class func email() -> String? {
        do {
            return try keychain.get(KeychainKeys.email.rawValue)
        } catch let error {
            print("error: \(error)")
            return nil
        }
    }

    class func removelogin() {
        do {
            try keychain.remove(KeychainKeys.login.rawValue)
            try keychain.remove(KeychainKeys.accountNumber.rawValue)
            try keychain.remove(KeychainKeys.email.rawValue)
        } catch let error {
            print("error: \(error)")
        }
    }
    
    class func saveAccount(account: Account) {
        if let login = account.login {
            savelogin(login: login)
        }
        if let accountNumber = account.accountNumber {
            saveAccountNumber(accountNumber: String(accountNumber))
        }
        if let email = account.email {
            saveEmail(email: email)
        }
    }
    
}
