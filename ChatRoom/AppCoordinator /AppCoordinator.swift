//
//  AppCoordinator.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppCoordinator {
    
    // MARK:
    // MARK:  Accessors
    
    let rootViewController: UserViewController
    var navigationController: UINavigationController
    let disposeBag: DisposeBag 
    let serviceManager: ServiceManager
    
    // MARK:
    // MARK:  Initialization
    
    init(mainViewController: UserViewController, serviceManager: ServiceManager) {
        self.rootViewController = mainViewController
        self.serviceManager = serviceManager
        self.navigationController = UINavigationController(rootViewController: self.rootViewController)
        self.disposeBag = DisposeBag()
    }
    
    // MARK:
    // MARK:  Public
    
    public func start() {
        self.presentRootViewController()
    }    
    
    // MARK:
    // MARK:  Private
    
    private func presentRootViewController() { 
        self.presentUserViewController()
    }
    
    private func presentUserViewController() {        
        let userModel = self.rootViewController.userModel
        
        self
            .rootViewController
            .didDismissedController
            .bind(onNext: { [weak userModel, weak self] model in
                switch model.state {
                case .register:
                    break
                case .loging:
                    self?.navigationController.dismiss(animated: false)
                case .user:
                    break
                case .userList:
                    userModel.apply(self?.presentUserListController)           
                }
            })
            .disposed(by: self.disposeBag)
    }
    
    private func presentUserListController(userModel: UserModel) {
        let dataSource = UserListDataSource(model: userModel, serviceManager: self.serviceManager)
        let userListViewController = UserListViewController(dataSource: dataSource, userModel: userModel)
        
        self.navigationController.pushViewController(userListViewController, animated: false)
    }
}


