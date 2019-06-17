//
//  HomeRouter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    var controller: HomeViewController?
    
//    func routeToHome(){
//        let HomeController = HomeViewController()
//        controller?.present(HomeController, animated: true, completion: nil)
//    }
    
    func routeToLogin(){
        
        //self.controller?.navigationController?.popViewController(animated: true)
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let newWindow = UIWindow()
            appDelegate.replaceWindow(newWindow)
            newWindow.rootViewController = UINavigationController(rootViewController: LoginViewController())
        }
        
    }
    
}
