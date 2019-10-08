//
//  Sequence+Array.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 15.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

extension Sequence {
    
    public func array() -> [Element] {
        return self.map { $0 }
    }

    public func flatten<Result>() -> [Result] where Element == Result? {
        return self.compactMap { $0 }
    }
}



