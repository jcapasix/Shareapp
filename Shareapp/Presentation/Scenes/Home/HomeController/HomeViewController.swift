//
//  HomeViewController.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/16/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class HomeViewController: UIViewController {

    var presenter: HomePresenter?
    var router: HomeRouter?
    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    
    var places = [Place]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = HomeConfigurator.sharedInstance.configure(self)
        
        ref = Database.database().reference()
        // Hide separators for empty cells
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.child("places").observe(.value) { snapshot in
            var places = [Place]()
            for placeSnapshot in snapshot.children {
                let place = Place(snapshot: placeSnapshot as! DataSnapshot)
                places.append(place)
            }
            self.places = places
        }
    }
    
    
    
    func initView(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(self.closeButtonPressed))
    }
    
    @objc func addButtonPressed(){
        print("addButtonPressed")
        self.router?.routeToNewPlace()
    }
    
    @objc func closeButtonPressed(){
        print("closeButtonPressed")
        self.presenter?.logoutUser()
    }
}

extension HomeViewController: HomePresenterProtocol{
    
    func logoutConfirm(rpt: Bool){
        if rpt{
            self.router?.routeToLogin()
        }
    }
    func showError(error:ErrorEntity){
        Utils.showAlert(error: error, view: self)
    }
}

// MARK: - Table view data source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeTableViewCell", for: indexPath) as! PlaceTableViewCell
        cell.place = self.places[indexPath.row]
        return cell
    }
}
