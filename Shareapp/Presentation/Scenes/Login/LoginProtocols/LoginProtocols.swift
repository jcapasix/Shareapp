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
}

protocol LoginInteractorInputProtocol {
    var presenter: LoginPresenter? {get set}
    var dataManager: LoginDataManager? {get set}
    //Presenter -> Interactor
}

protocol LoginInteractorOutputProtocol {
    //Interactor -> Presenter
}

protocol LoginDataManagerInputProtocol {
    //Interactor -> DataManager
}

protocol LoginDataManagerOutputProtocol {
    //DataManager -> Interactor
}

protocol LoginWireframeProtocol {
    //Presenter -> Wireframe
}

protocol LoginRouterProtocol {
    
    var controller: LoginViewController? {get set}
    //View -> Router
}
