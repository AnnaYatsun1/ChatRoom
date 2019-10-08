//
//  UserListViewCell.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 26/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class UserListViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView?
    @IBOutlet var nameLable: UILabel?
    @IBOutlet var emailLable: UILabel?
    
    func fill(userModel: UserModel) {
        self.nameLable?.text = userModel.name
        self.emailLable?.text = userModel.email
        self.profileImageView?.image = userModel.image
    }
}
