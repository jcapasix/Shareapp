//
//  RegisterProtocols.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

protocol RegisterViewProtocol {
    
    var controller: RegisterViewController? {get set}
    var wireFrame:  RegisterWireFrame? {get set}
    var interactor: RegisterInteractor? {get set}
    
    //View -> Presenter
    func viewDidLoad()
}

protocol RegisterPresenterProtocol {
    //Presenter -> View
}

protocol RegisterInteractorInputProtocol {
    var presenter: RegisterPresenter? {get set}
    var dataManager: RegisterDataManager? {get set}
    //Presenter -> Interactor
}

protocol RegisterInteractorOutputProtocol {
    //Interactor -> Presenter
}

protocol RegisterDataManagerInputProtocol {
    //Interactor -> DataManager
}

protocol RegisterDataManagerOutputProtocol {
    //DataManager -> Interactor
}

protocol RegisterWireframeProtocol {
    //Presenter -> Wireframe
}

protocol RegisterRouterProtocol {
    
    var controller: RegisterViewController? {get set}
    //View -> Router
}
