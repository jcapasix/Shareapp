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
    
}

extension LoginInteractor: LoginDataManagerOutputProtocol{
    
}
