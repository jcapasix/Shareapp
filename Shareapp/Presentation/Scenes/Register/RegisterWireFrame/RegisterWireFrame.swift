//
//  RegisterWireFrame.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class RegisterWireFrame: RegisterWireframeProtocol{
    var controller: RegisterViewController?
    
    func initView(){
        self.controller?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
