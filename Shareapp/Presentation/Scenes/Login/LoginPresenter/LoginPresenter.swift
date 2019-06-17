//
//  LoginPresenter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewProtocol {
    
    var controller: LoginViewController?
    var wireFrame:  LoginWireFrame?
    var interactor: LoginInteractor?
    
    func viewDidLoad() {
        
    }
    
    
}

extension LoginPresenter: LoginInteractorOutputProtocol{
    
}
