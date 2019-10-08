//
//  When-Unless.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 01.12.2018.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

public func when<Result>(_ condition: Bool, execute: () -> Result?) -> Result? {
    return condition ? execute() : nil
}

public func unless<Result>(_ condition: Bool, exetute: () -> Result? ) -> Result? {
    return when(!condition, execute: exetute)
}


