//
//  LoginProtocols.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

protocol LoginViewProtocol {
    
    var controller: LoginViewController? {get set}
    var wireFrame:  LoginWireFrame? {get set}
    var interactor: LoginInteractor? {get set}
    
    //View -> Presenter
    func viewDidLoad()
}

protocol LoginPresenterProtocol {
    //Presenter -> View
    func showUser(user: User)
    func logoutConfirm(rpt: Bool)
    func showError(error:ErrorEntity)
}

protocol LoginInteractorInputProtocol {
    var presenter: LoginPresenter? {get set}
    var dataManager: LoginDataManager? {get set}
    //Presenter -> Interactor
}

protocol LoginInteractorOutputProtocol {
    //Interactor -> Presenter
    func showUser(user: User)
    func showError(error:ErrorEntity)
}

protocol LoginDataManagerInputProtocol {
    //Interactor -> DataManager
}

protocol LoginDataManagerOutputProtocol {
    //DataManager -> Interactor
    func showUser(user: User)
    func showError(error:ErrorEntity)
}

protocol LoginWireframeProtocol {
    //Presenter -> Wireframe
    var controller: LoginViewController? {get set}
}

protocol LoginRouterProtocol {
    
    var controller: LoginViewController? {get set}
    
    //View -> Router
    func routeToHome()
    func routeToRegister()
    func routeToLogin()
}
