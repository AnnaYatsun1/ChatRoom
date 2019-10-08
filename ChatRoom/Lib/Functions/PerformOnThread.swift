//
//  PerformOnThread.swift
//  Squares
//
//  Created by Yevhen Triukhan on 1/14/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

enum Thread {
    case main
    case background
}

//public func performOnMainThread(
//    type: ExecuteType = .async,
//    execute: @escaping Closure.VoidExecute
//) {
//    perform(queue: DispatchQueue.main, type: type, execute: execute)
//}
//
//public func performInBackground(
//    _ qos: DispatchQoS.QoSClass = .background,
//    type: ExecuteType = .async,
//    execute: @escaping Closure.VoidExecute
//) {
//    perform(queue: DispatchQueue.global(qos: qos), type: type, execute: execute)
//}
//
//fileprivate func perform(
//    queue: DispatchQueue,
//    type: ExecuteType,
//    execute: @escaping Closure.VoidExecute
//) {
//    switch type {
//    case .async: queue.async { execute() }
//    case .sync: queue.sync { execute() }
//    }
//}
