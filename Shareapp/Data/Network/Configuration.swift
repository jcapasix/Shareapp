//
//  Configuration.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import Alamofire

enum Enviroment: String{
    case PROD
    case DEV
}

public protocol Configuration {
    static var serverURL: String { get }
    static var environment: String { get }
}

public struct ProductionConfig: Configuration {
    public static let serverURL         = ""
    public static let environment       = Enviroment.PROD.rawValue
}

public struct DevelopConfig: Configuration {
    public static let serverURL         = ""
    public static let environment       = Enviroment.DEV.rawValue
}

class AppEnvironment{
    
    static var configuration:Configuration.Type{
        #if DEVELOPMENT
        return DevelopConfig.self
        #else
        return ProductionConfig.self
        #endif
    }
    //static var headers:Headers?
}


