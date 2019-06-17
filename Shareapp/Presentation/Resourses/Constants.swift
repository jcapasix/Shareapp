//
//  Constants.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation


let NO_TEXT = ""

struct Errors {
    static let REGISTER_PASSWORD_CONFIRM = ErrorEntity(title: "Error en Registro", message: "Las Constraseñas no coinciden")
    static let REGISTER_EMAIL_FAIL = ErrorEntity(title: "Error en Registro", message: "El email no tiene un formato correcto")
    static let REGISTER_ERROR = ErrorEntity(title: "Error en Registro", message: "Error al intentar crear el usuario")

}
