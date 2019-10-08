//
//  NSLocking+Do.swift
//  Atomic
//
//  Created by Yevhen Triukhan on 10/31/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

extension NSLocking {
    
    public func `do`<Result>(_ action: () -> Result) -> Result {
        self.lock()
        defer { self.unlock() }
        
        return action()
    }
}

