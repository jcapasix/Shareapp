//
//  RegisterInteractor.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterInteractor: RegisterInteractorInputProtocol {
    
    var presenter: RegisterPresenter?
    var dataManager: RegisterDataManager?
}

extension RegisterInteractor: RegisterDataManagerOutputProtocol{
    
}
