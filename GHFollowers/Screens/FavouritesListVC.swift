//
//  FavouritesListVC.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 02/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit

class FavouritesListVC: GFDataLoadingVC {
    
    let tableView               = UITableView()
    var favourites: [Follower]  = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureTableView()
        getFavourites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavourites()
    }
    
    
    private func configureViewController() {
        view.backgroundColor    = .systemBackground
        title                   = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.reuseID)
        tableView.removeExcessCells()
    }
    
    
    func getFavourites() {
        PersistenceManager.retrieveFavourites { [weak self](result) in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let favourites):
                
                if favourites.isEmpty {
                    self.showEmptyStateView(with: "No Favourites?\nAdd one on the follower screen.", in: self.view)
                } else {
                    self.favourites = favourites
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
                
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    

}


extension FavouritesListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell            = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.reuseID) as! FavouriteCell
        let favourite       = favourites[indexPath.row]
        cell.set(favourite: favourite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favourite       = favourites[indexPath.row]
        let destVC          = FollowerListVC(username: favourite.login)
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistenceManager.updateWith(favourite: favourites[indexPath.row], actionType: .remove) { [weak self](error) in
            guard let self = self else { return }
            guard let error = error else {
                self.favourites.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
                
                if self.favourites.isEmpty { self.getFavourites() }
                return
            }
            
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
