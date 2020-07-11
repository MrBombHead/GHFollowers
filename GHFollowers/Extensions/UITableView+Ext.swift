//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 11/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit


extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
