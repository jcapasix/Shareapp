//
//  HomeInteractor.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    var presenter: HomePresenter?
    var dataManager: HomeDataManager?
    
    func logoutUser(){
        self.dataManager?.logoutUser()
    }
}

extension HomeInteractor: HomeDataManagerOutputProtocol{
    func logoutConfirm(rpt: Bool){
        self.presenter?.logoutConfirm(rpt: rpt)
    }
}
