//
//  AuthManager.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class AuthManager{
    
    private static let _sharedInstance = AuthManager()
    
    private let userDefaults = UserDefaults.standard
    
    static var sharedInstance: AuthManager{
        return _sharedInstance
    }
    
    //MARK: - TOKEN
    
    func login(value:Bool){
        userDefaults.set(value, forKey: "is_login")
        userDefaults.synchronize()
    }

    func isLogin()->Bool{
        guard Utils.isKeyPresentInUserDefaults(key: "is_login") else{
            return false
        }
        if (userDefaults.bool(forKey: "is_login") == true){
            return true
        }
        else{
            return false
        }
    }
    
}

