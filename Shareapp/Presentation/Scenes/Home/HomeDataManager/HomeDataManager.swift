//
//  HomeDataManager.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseAuth
import SVProgressHUD

class HomeDataManager: HomeDataManagerInputProtocol {
    
    var interactor:HomeInteractor?
    
    func logoutUser(){
        if Auth.auth().currentUser != nil{
            do{
                try Auth.auth().signOut();
                self.interactor?.logoutConfirm(rpt: true)
            }catch{
                self.interactor?.logoutConfirm(rpt: false)
            }
        }
        self.interactor?.logoutConfirm(rpt: true)
    }
    
}
