//
//  HomeWireFrame.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireframeProtocol{
    var controller: HomeViewController?
    
    func initView(){
        self.controller?.navigationController?.setNavigationBarHidden(false, animated: false)
        self.controller?.title = "Lugares"
    }
}
