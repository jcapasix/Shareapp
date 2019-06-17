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
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = LoginConfigurator.sharedInstance.configure(self)
    }

    
    // MARK: - Actions

    @IBAction func loginButtonPressed(_ sender: Any) {
        self.presenter?.loginUser(email: self.emailTextField.text, password: self.passwordTextField.text)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.router?.routeToRegister()
    }
    
}

extension LoginViewController: LoginPresenterProtocol{
    
    func showUser(user: User){
        self.router?.routeToHome()
    }
    
    func logoutConfirm(rpt: Bool){
        self.router?.routeToLogin()
    }
    
    func showError(error:ErrorEntity){
        Utils.showAlert(error: error, view: self)
    }
}
