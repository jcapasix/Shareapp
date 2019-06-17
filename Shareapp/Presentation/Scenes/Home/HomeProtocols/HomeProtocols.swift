//
//  HomeProtocols.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

protocol HomeViewProtocol {
    
    var controller: HomeViewController? {get set}
    var wireFrame:  HomeWireFrame? {get set}
    var interactor: HomeInteractor? {get set}
    
    //View -> Presenter
    func viewDidLoad()
}

protocol HomePresenterProtocol {
    //Presenter -> View
    func logoutConfirm(rpt: Bool)
    func showError(error:ErrorEntity)
}

protocol HomeInteractorInputProtocol {
    var presenter: HomePresenter? {get set}
    var dataManager: HomeDataManager? {get set}
    
    //Presenter -> Interactor
    func logoutUser()
}

protocol HomeInteractorOutputProtocol {
    //Interactor -> Presenter
    func logoutConfirm(rpt: Bool)
}

protocol HomeDataManagerInputProtocol {
    //Interactor -> DataManager
    func logoutUser()
}

protocol HomeDataManagerOutputProtocol {
    //DataManager -> Interactor
    func logoutConfirm(rpt: Bool)
}

protocol HomeWireframeProtocol {
    //Presenter -> Wireframe
    func initView()
}

protocol HomeRouterProtocol {
    
    var controller: HomeViewController? {get set}
    
    //View -> Router
    func routeToLogin()
}
