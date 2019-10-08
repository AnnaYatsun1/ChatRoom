//
//  Closure.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 10/31/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

public enum Closure {
    public typealias VoidCompletion = () -> ()
    public typealias VoidExecute = () -> ()
    
    public typealias Completion<Value> = (Value) -> ()
    public typealias Execute<Value> = (Value) -> ()
    
    public typealias SuccessCompletion<Model> = (Model) -> ()
    public typealias FailureCompletion = (Error) -> ()
}
