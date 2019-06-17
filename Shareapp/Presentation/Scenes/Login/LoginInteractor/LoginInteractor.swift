//
//  LoginInteractor.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    
    var presenter: LoginPresenter?
    var dataManager: LoginDataManager?
    
    func loginUser(email:String?, password:String?){
        self.dataManager?.loginUser(email: email, password: password)
    }
    
}

extension LoginInteractor: LoginDataManagerOutputProtocol{
    func showUser(user: User){
        AuthManager.sharedInstance.login(value: true)
        self.presenter?.showUser(user: user)
    }
    
    func showError(error:ErrorEntity){
        self.presenter?.showError(error: error)
    }
}
