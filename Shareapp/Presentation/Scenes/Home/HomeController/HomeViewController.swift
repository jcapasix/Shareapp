//
//  HomeViewController.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenter?
    var router: HomeRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = HomeConfigurator.sharedInstance.configure(self)
    }
}

extension HomeViewController: HomePresenterProtocol{
    
    func logoutConfirm(rpt: Bool){
        
    }
    func showError(error:ErrorEntity){
        Utils.showAlert(error: error, view: self)
    }
}
