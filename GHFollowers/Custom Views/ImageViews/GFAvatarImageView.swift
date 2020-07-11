//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 05/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache

    let placeholderImage = Images.placeholderImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        enableAutoLayout()
    }

}