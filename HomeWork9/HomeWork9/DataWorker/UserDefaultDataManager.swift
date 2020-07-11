//
//  UserDefaultDataManager.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import Foundation

struct UserDefaultDataManager {
    
    private enum Locals {
        static let loginKey = "name"
        static let passwordKey = "password"
        static let userSessionKey = "com.save.usersession"
        static let auth = "AUTH"
        static let userDefault = UserDefaults.standard
    }
    
    
    //MARK: ~ UserDataModel
    
    struct UserDetails {
        let login: String
        let password: String
        
        init?(_ json: [String: String]) {
            if let login = json[Locals.loginKey], let password = json[Locals.passwordKey] {
                self.login = login
                self.password = password
                return
            }
            return nil
        }
    }
    
    
    //MARK: ~Methods
    
    static func save(_ name: String, password: String) {
        Locals.userDefault.set([Locals.loginKey: name, Locals.passwordKey: password], forKey: Locals.userSessionKey)
    }
    
    static func authenficate() {
        Locals.userDefault.set(true, forKey: Locals.auth)
    }
    
    static func deauthenficate() {
        Locals.userDefault.set(false, forKey: Locals.auth)
    }
    
    static func isAuthenficated() -> Bool {
        return Locals.userDefault.bool(forKey: Locals.auth)
    }
    
    static func getUserDetails() -> UserDetails? {
        return UserDetails((Locals.userDefault.value(forKey: Locals.userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func clearUserData() {
        Locals.userDefault.removeObject(forKey: Locals.userSessionKey)
    }
}
