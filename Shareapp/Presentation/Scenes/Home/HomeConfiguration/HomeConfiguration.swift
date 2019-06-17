//
//  HomeConfiguration.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class HomeConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = HomeConfigurator()
    
    // MARK: Configuration
    func configure(_ controller: HomeViewController){
        
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let wireFrame = HomeWireFrame()
        let dataManager = HomeDataManager()
        
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
