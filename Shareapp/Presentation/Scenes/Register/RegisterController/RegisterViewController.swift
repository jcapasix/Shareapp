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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = RegisterConfigurator.sharedInstance.configure(self)
    }
    
    // MARK: Actions
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.router?.closeController()
    }
    
}
