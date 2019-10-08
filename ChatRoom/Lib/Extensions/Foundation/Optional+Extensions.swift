//
//  Optional+Do.swift
//  Humans
//
//  Created by Yevhen Triukhan on 10/18/18.
//  Copyright © 2018 Student. All rights reserved.
//

extension Optional {
   
    public var isNone: Bool {
        get {
            switch self {
            case .none: return true
            case .some: return false
            }
        }
    }
    
    public var isSome: Bool {
        get { return !self.isNone }
    }
    
    public func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
    
    public func apply<Result>(_ transform: ((Wrapped) -> Result)?) -> Result? {
        return self.flatMap {
            transform?($0)
        }
    }
    
    func or(_ action: () -> Wrapped) -> Wrapped {
        return self ?? action()
    }
}

extension Optional where Wrapped: Collection {
    
    public var isEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
