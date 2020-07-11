//
//  Follower.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 04/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
