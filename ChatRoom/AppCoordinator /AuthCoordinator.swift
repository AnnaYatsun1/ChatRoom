//
//  AuthCoordinator.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 03/10/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AuthCoordinator {
    let navigationController: UINavigationController
    let mainViewController: LoginViewController
    let serviceManager: ServiceManager
    let disposeBag: DisposeBag
    
    var appCoordinator: AppCoordinator?
    
    init(mainViewController: LoginViewController,serviceManager: ServiceManager) {
        self.mainViewController = mainViewController
        self.serviceManager = serviceManager
        self.disposeBag = DisposeBag()
        self.navigationController = UINavigationController(rootViewController: self.mainViewController)
        self.navigationController.isNavigationBarHidden = true
    }
    
    
    public func start() {
        self.presentRootViewController()
    }    
    
    // MARK:
    // MARK:  Private
    
    private func presentRootViewController() { 
        self.mainViewController
            .didChangedController
            .bind(onNext: { [weak self] model in
                switch model.state {
                case .register:
                    self?.presentRegisterViewController(model: model)
                case .loging:
                    break
                case .user:                    
                    (self?.disposeBag).do { disposeBag in
                        self?
                            .mainViewController
                            .didLoginUser
                            .observeOn(MainScheduler.asyncInstance)
                            .bind(onNext: { userModel in
                                (self?.serviceManager).do { serviceManager in
                                    let mainViewController = UserViewController(userModel: userModel, model: model, serviceManager: serviceManager)
                                    
                                    self?.appCoordinator = AppCoordinator(mainViewController: mainViewController, serviceManager: serviceManager)                            
                                    self?.appCoordinator?.start()
                                    
                                    self?.appCoordinator.do { appCoordinator in
                                        self?.navigationController.present(appCoordinator.navigationController, animated: false)
                                    }                                    
                                }
                            }).disposed(by: disposeBag)
                    }
          
                case .userList:
                    break
                }
            })
            .disposed(by: self.disposeBag)
    }
    
    private func presentRegisterViewController(model: Model) {
        let registerViewController = RegisterViewController(model: model, serviceManager: self.serviceManager)
        registerViewController
            .didChangedController
            .bind(onNext: { model in
                switch model.state {
                case .register:
                    break
                case .loging:
                     self.navigationController.popViewController(animated: false)
                case .user:
                    break
                case .userList:
                    break
                }
            })
            .disposed(by: self.disposeBag)
        self.navigationController.pushViewController(registerViewController, animated: false)
    }
}
