//
//  UIView.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 06/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit


extension UIView {
    
    func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
    
    
    func pin(to superview: UIView) {
        enableAutoLayout()
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
        
    }
}
