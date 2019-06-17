//
//  LoginViewController.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenter?
    var router: LoginRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = LoginConfigurator.sharedInstance.configure(self)
    }

    
    // MARK: - Actions

    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.router?.routeToRegister()
    }
    
}

extension LoginViewController: LoginPresenterProtocol{
    
}
