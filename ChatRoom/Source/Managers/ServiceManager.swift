//
//  ServiceManager.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 24/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

class ServiceManager: AuthServiceProtocol  {
                 
    let authService: AuthServiceProtocol
    
    convenience init() {
       self.init(authService: AuthService())
    }
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func createUser(model: UserModel, completion: @escaping VoidCompletion) {
        self.authService.createUser(model: model, completion: completion)
    }
    
    func signOut() {
        self.authService.signOut()
    }
    
    func loginUser(email: String, password: String, completion: @escaping Completion<UserModel>) {
        self.authService.loginUser(email: email, password: password, completion: completion)
    }
    
    func getUser(_ completion: @escaping Completion<UserModel>) {
        self.authService.getUser(completion)
    }
}
