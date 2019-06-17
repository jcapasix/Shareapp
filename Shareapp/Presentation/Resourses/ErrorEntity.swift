//
//  ErrorEntity.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation

class ErrorEntity{
    
    var title:String?
    var message:String?
    var code:Int?
    
    init(title:String, message:String) {
        self.title = title
        self.message = message
    }
    
}
