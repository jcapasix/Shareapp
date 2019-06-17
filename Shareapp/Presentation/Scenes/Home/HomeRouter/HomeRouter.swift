//
//  HomeRouter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    
    var controller: HomeViewController?
    
    func routeToHome(){
        let HomeController = HomeViewController()
        controller?.present(HomeController, animated: true, completion: nil)
    }
    
    func closeController(){
        controller?.dismiss(animated: true, completion: nil)
    }
    
}
