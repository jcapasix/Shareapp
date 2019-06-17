//
//  LoginRouter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginRouter: LoginRouterProtocol {
    
    var controller: LoginViewController?
    
    func routeToRegister(){
        let registerController = RegisterViewController()
        controller?.present(registerController, animated: true, completion: nil)
    }
    
}
