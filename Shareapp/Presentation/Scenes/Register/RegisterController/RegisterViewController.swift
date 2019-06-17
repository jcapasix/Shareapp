//
//  RegisterViewController.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var presenter: RegisterPresenter?
    var router: RegisterRouter?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = RegisterConfigurator.sharedInstance.configure(self)
    }
    
    // MARK: Actions
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.presenter?.registerUser(email: self.emailTextField.text, password: self.passwordTextField.text, passwordConfirm: self.passwordConfirmTextField.text)
    }
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.router?.routeToClose()
    }
    
    //MARK: - Own Methods
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

extension RegisterViewController: RegisterPresenterProtocol{
    func showError(error:ErrorEntity){
        Utils.showAlert(error: error, view: self)
    }
}
