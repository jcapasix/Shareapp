//
//  RegisterDataManager.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth
import SVProgressHUD

class RegisterDataManager: RegisterDataManagerInputProtocol {
    
    var interactor:RegisterInteractor?
    
    func registerUser(email:String?, password:String?){
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: email!, password: password!){ (user, error) in
            SVProgressHUD.dismiss()
            if error == nil {
                self.interactor?.showUser(user: User())
            }
            else{
                self.interactor?.showError(error: Errors.REGISTER_ERROR)
            }
        }
    }
    
}
