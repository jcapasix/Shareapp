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
        self.wireFrame?.initView()
    }
    
    func loginUser(email:String?, password:String?){
        
        if password != NO_TEXT{
            if Utils.isValidEmail(email: email ?? NO_TEXT){
                self.interactor?.loginUser(email: email, password: password)
            }
            else{
                self.controller?.showError(error: Errors.REGISTER_EMAIL_FAIL)
            }
        }
        else{
            self.controller?.showError(error: Errors.REGISTER_PASSWORD_CONFIRM)
        }
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol{
    
    func showUser(user: User){
        self.controller?.showUser(user: user)
    }
    
    func showError(error:ErrorEntity){
        self.controller?.showError(error: error)
    }
}
