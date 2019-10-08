//
//  Int+Times.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 10/22/18.
//  Copyright © 2018 Student. All rights reserved.
//

extension Strideable where Self.Stride: SignedInteger, Self: ExpressibleByIntegerLiteral {
    
    public func times(_ execute: () -> ()) {
        (0..<self).forEach { _ in
            execute()
        }
    }
}
