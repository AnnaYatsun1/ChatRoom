//
//  Cast.swift
//  Squares
//
//  Created by Yevhen Triukhan on 1/1/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

public func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}
