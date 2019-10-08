//
//  ObservableObject+Observer.swift
//  Carwash
//
//  Created by Anna Yatsun on 20/05/2019.
//  Copyright © 2019 Student. All rights reserved.
//

extension ObservableObject {
    
    public class Observer: Cancellable {
        
        public var isObserving: Bool {
            return self.observable.isSome
        }
        
        public var isCancelled: Bool {
            return !self.isObserving
        }

        public let handler: Handler
        
        private weak var observable: ObservableObject?
        
        // MARK: - Initialization
        init(target: ObservableObject, handler: @escaping Handler) {
            self.handler = handler
            self.observable = target
        }
        
        // MARK: - Public API
        public func cancel() {
            print("ObservableObject(\(self)) is cancelled")
            self.observable = nil
        }
    }
}
