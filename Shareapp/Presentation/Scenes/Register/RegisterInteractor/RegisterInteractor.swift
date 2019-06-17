//
//  RegisterInteractor.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth

class RegisterInteractor: RegisterInteractorInputProtocol {
    
    var presenter: RegisterPresenter?
    var dataManager: RegisterDataManager?
    
    func registerUser(email:String?, password:String?){
        self.dataManager?.registerUser(email: email, password: password)
    }
}

extension RegisterInteractor: RegisterDataManagerOutputProtocol{
    func showUser(user: User){
        self.presenter?.showUser(user: user)
    }
    
    func showError(error:ErrorEntity){
        self.presenter?.showError(error: error)
    }
}
