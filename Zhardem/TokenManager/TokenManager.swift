//
//  TokenManager.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 26.04.2024.
//

import UIKit

class TokenManager {
    static let tokenInstance = TokenManager()
    let userDefault = UserDefaults.standard
    
    func saveToken(token: String) {
        userDefault.setValue(token, forKey: TokenKey.userLogin)
    }
    
    
    func getToken() -> String {
        if let token = userDefault.object(forKey: TokenKey.userLogin) as? String {
            return token
        } else {
            return ""
        }
    }
    
    func checkForLogin() -> Bool {
        if getToken() == ""{
            return false
        } else {
            return true
        }
    }
    
    func removeToken() {
        userDefault.removeObject(forKey: TokenKey.userLogin)
    }
}
