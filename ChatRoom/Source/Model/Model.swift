//
//  Model.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Model {
    
    public enum State {
        case register
        case loging
        case user
        case userList
    }
    
    var didChangedState = PublishSubject<State>()
    
    var state: State {
        willSet { self.didChangedState.onNext(newValue) }
    }
    
    init(state: State) {
        self.state = state
    }
}

