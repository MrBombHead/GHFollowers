//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 05/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimimItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimimItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    
    
}