//
//  LoginConfigurator.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class LoginConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()
    
    // MARK: Configuration
    func configure(_ controller: LoginViewController){
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let wireFrame = LoginWireFrame()
        let dataManager = LoginDataManager()
        
        presenter.controller = controller
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        router.controller = controller
        controller.presenter = presenter
        controller.router = router
        
        wireFrame.controller = controller
        
    }
}
