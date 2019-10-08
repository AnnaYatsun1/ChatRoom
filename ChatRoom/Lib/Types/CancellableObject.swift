
//  Created by Anna Yatsun on 20/05/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

public class AbstractCancellableObject<Storage> {
    
    public var value: Storage {
        get { return self.atomicCancellable.value }
        set { self.atomicCancellable.value = newValue }
    }
    
    private let atomicCancellable: Atomic<Storage>
    
    // MARK: - Initialization
    deinit {
        print("deinit abstract cancellable object")
        self.atomicCancellable.value = self.atomicCancellable.value
    }

    init(initial: Storage, dispose: @escaping (Storage) -> ()) {
        self.atomicCancellable = Atomic(initial, lock: .init(), willSet: { dispose($0.old) })
    }
}

public class CancellableObject: AbstractCancellableObject<Cancellable?> {
    
    // MARK: - Initialization
    init() {
        super.init(initial: nil) {
            $0?.cancel() }
    }
}

public class CompositeCancellableObject: AbstractCancellableObject<[Cancellable]> {
    
    // MARK: - Initialization
    init() {
        super.init(initial: []) {
            $0.forEach { $0.cancel()  }
        }
    }
}
