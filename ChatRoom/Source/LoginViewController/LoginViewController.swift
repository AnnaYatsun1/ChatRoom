//
//  LoginViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: RootViewController<LoginView> {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareRootView()
    }
    
    var didLoginUser = PublishSubject<UserModel>()
    
    private func prepareRootView() {
        self.rootView?.prepareStyle()
        self.rootView?.registerButton?.addTarget(self, action: #selector(self.handlerMoveToRegister), for: .touchUpInside)
        self.rootView?.loginButton?.addTarget(self, action: #selector(self.handlerDidLogin), for: .touchUpInside)
    }
    
    @objc func handlerDidLogin(_ sender: UIButton) {
        self.rootView?.loginTextField?.text.do { email in
            self.rootView?.passwordtextField?.text.do { password in
                self.serviceManager.loginUser(email: email, password: password) { user in 
                        self.model.state = .user
                        self.didChangedController.onNext(self.model)
                        self.didLoginUser.onNext(user)                        
                }               
            }
        }
        
        // need get user data from Firebase, 
    }
    
    @objc func handlerMoveToRegister(_ sender: UIButton) {
        self.model.state = .register
        self.didChangedController.onNext(self.model)

    }
}
