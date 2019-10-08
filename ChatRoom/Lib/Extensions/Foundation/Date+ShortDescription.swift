//
//  Date+ShortDescription.swift
//  Weather
//
//  Created by Yevhen Triukhan on 14.01.2019.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

extension Date {
    
    public var shortDescription: String {
        return DateFormatter().short.string(from: self)
    }
}
