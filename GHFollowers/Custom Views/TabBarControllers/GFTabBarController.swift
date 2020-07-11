//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 09/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor     = .systemGreen
        self.viewControllers                = [createSearchNC(), createFavsNC()]
        
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createFavsNC() -> UINavigationController {
        let favVC = FavouritesListVC()
        favVC.title = "Favourites"
        favVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favVC)
    }

}
