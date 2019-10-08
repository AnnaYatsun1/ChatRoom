//
//  RegisterView.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RegisterView: MainView {
    
    @IBOutlet var nameTextField: TextFieldWithPadding?
    @IBOutlet var emailTextField: TextFieldWithPadding?
    @IBOutlet var passwordTextField: TextFieldWithPadding?
    @IBOutlet var registerButton: UIButton?
    @IBOutlet var loginButton: UIButton?
    @IBOutlet var profileImageView: UIImageView?
    
    override func prepareStyle() {
        [self.nameTextField, self.emailTextField,self.passwordTextField, self.registerButton, self.loginButton].forEach {
            self.prepareLayer(control: $0)
        }
    
        self.add(padding: Constants.textFieldsPadding, to: [self.nameTextField, self.emailTextField, self.passwordTextField])
    
        self.nameTextField?.setMax(length: 20)
        self.emailTextField?.setMax(length: 40)
        self.passwordTextField?.setMax(length: 30)
    }
}

