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
}

protocol HomeInteractorInputProtocol {
    var presenter: HomePresenter? {get set}
    var dataManager: HomeDataManager? {get set}
    //Presenter -> Interactor
}

protocol HomeInteractorOutputProtocol {
    //Interactor -> Presenter
}

protocol HomeDataManagerInputProtocol {
    //Interactor -> DataManager
}

protocol HomeDataManagerOutputProtocol {
    //DataManager -> Interactor
}

protocol HomeWireframeProtocol {
    //Presenter -> Wireframe
}

protocol HomeRouterProtocol {
    
    var controller: HomeViewController? {get set}
    //View -> Router
}
