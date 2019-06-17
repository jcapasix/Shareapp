//
//  RegisterPresenter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterPresenter: RegisterViewProtocol {
    
    var controller: RegisterViewController?
    var wireFrame:  RegisterWireFrame?
    var interactor: RegisterInteractor?
    
    func viewDidLoad() {
        
    }
}

extension RegisterPresenter: RegisterInteractorOutputProtocol{
    
}
