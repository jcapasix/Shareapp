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
    
    
    
    func initView(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(self.closeButtonPressed))
    }
    
    @objc func addButtonPressed(){
        print("addButtonPressed")
    }
    
    @objc func closeButtonPressed(){
        print("closeButtonPressed")
        self.presenter?.logoutUser()
    }
}

extension HomeViewController: HomePresenterProtocol{
    
    func logoutConfirm(rpt: Bool){
        if rpt{
            self.router?.routeToLogin()
        }
    }
    func showError(error:ErrorEntity){
        Utils.showAlert(error: error, view: self)
    }
}
