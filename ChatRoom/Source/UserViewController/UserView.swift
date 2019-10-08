//
//  UserView.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

class UserView: MainView {
    
    @IBOutlet var userNamelable: UILabel!
    
    func fill(model: UserModel) {
        self.userNamelable?.text = model.name
    }
}
