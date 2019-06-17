//
//  LoginWireFrame.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class LoginWireFrame: LoginWireframeProtocol{
    var controller: LoginViewController?
    
    var tap: UITapGestureRecognizer!
    
    func initView(){
        self.controller?.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tap = UITapGestureRecognizer(target: self.controller, action: #selector(self.controller?.dismissKeyboard))
        self.controller?.view.addGestureRecognizer(tap)
    }
    
}
