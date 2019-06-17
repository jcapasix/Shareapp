//
//  RegisterConfigurator.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = RegisterConfigurator()
    
    // MARK: Configuration
    func configure(_ controller: RegisterViewController){
        
        let presenter = RegisterPresenter()
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let wireFrame = RegisterWireFrame()
        let dataManager = RegisterDataManager()
        
        presenter.controller = controller
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        router.controller = controller
        controller.presenter = presenter
        controller.router = router
        
        dataManager.interactor = interactor
        wireFrame.controller = controller
        
    }
}
