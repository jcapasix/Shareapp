//
//  LoginWireFrame.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class LoginWireFrame: LoginWireframeProtocol{
    var controller: LoginViewController?
    
    func initView(){
        self.controller?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
