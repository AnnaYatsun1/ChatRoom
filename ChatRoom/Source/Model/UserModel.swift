//
//  RegisterModel.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class UserModel {

    let name: String
    let email: String
    var password: String
    var image: UIImage
    
    var needReloadCell = PublishSubject<Void>()
    
    init(name: String, email: String, password: String, image: UIImage) {
        self.name = name
        self.email = email
        self.password = password
        self.image = image
    }
}
