//
//  HomePresenter.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomePresenter: HomeViewProtocol {
    
    var controller: HomeViewController?
    var wireFrame:  HomeWireFrame?
    var interactor: HomeInteractor?
    
    func viewDidLoad() {
        self.wireFrame?.initView()
    }
    
    func logoutUser(){
        self.interactor?.logoutUser()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol{
    
    func logoutConfirm(rpt: Bool){
        self.controller?.logoutConfirm(rpt: rpt)
    }
}
