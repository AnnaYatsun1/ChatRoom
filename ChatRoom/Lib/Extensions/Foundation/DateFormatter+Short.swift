//
//  DateFormatter.swift
//  Weather
//
//  Created by Yevhen Triukhan on 19.01.2019.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    public var short: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }
}
