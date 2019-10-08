//
//  UserViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RootTableViewController: UITableViewController {
    
    let userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    @objc func handlerLogout() {

    }
    
    @objc func handlerMoveToMessage() {                

    }
}

class UserViewController: RootTableViewController {
    
    let model: Model
    let serviceManager: ServiceManager
    
    var didDismissedController = PublishSubject<Model>()

    init(userModel: UserModel, model: Model, serviceManager: ServiceManager) {
        self.model = model
        self.serviceManager = serviceManager
        
        super.init(userModel: userModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.handlerLogout))
    
        let image = UIImage(named: "sendMassage")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.handlerMoveToMessage))
    }
    
    override func handlerLogout() {
        self.dismiss(animated: false) {
            self.serviceManager.signOut()
            self.model.state = .loging
            self.didDismissedController.onNext(self.model)
        }
    }
    
    override func handlerMoveToMessage() {
        self.model.state = .userList
        self.didDismissedController.onNext(self.model)
    }
}
