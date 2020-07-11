//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Craig Cornwell on 08/07/2020.
//  Copyright © 2020 Craig Cornwell. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
    
        return dateFormatter.string(from: self)
    }
}
