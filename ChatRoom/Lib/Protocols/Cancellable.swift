//
//  Cancellable.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 22.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

public protocol Cancellable {
    
    var isCancelled: Bool { get }
    
    func cancel()
}
