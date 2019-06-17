//
//  LoginDataManager.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD
import FirebaseAuth

class LoginDataManager: LoginDataManagerInputProtocol {
    
    var interactor:LoginInteractor?
    
    func loginUser(email:String?, password:String?){
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
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
