//
//  RegisterPresenter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD

class RegisterPresenter: RegisterViewProtocol {
    
    var controller: RegisterViewController?
    var wireFrame:  RegisterWireFrame?
    var interactor: RegisterInteractor?
    
    func viewDidLoad() {
        self.wireFrame?.initView()
    }
    
    func registerUser(email:String?, password:String?, passwordConfirm:String?){
        
        if password == passwordConfirm{
            if Utils.isValidEmail(email: email ?? NO_TEXT){
                self.interactor?.registerUser(email: email, password: password)
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

extension RegisterPresenter: RegisterInteractorOutputProtocol{
    
    func showUser(user: User){
        
    }
    
    func showError(error:ErrorEntity){
        self.controller?.showError(error: error)
    }
    
}
