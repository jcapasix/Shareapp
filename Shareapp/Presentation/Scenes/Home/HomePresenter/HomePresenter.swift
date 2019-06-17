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
        
    }
}

extension HomePresenter: HomeInteractorOutputProtocol{
    
}
