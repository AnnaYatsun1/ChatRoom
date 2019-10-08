//
//  AppDelegate.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AuthCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let authService = AuthService()
        let model = Model.init(state: .loging)
        let serviceManager = ServiceManager(authService: authService)
        let mainViewController = LoginViewController.init(model: model, serviceManager: serviceManager)
        self.coordinator = AuthCoordinator.init(mainViewController: mainViewController, serviceManager: serviceManager)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.coordinator?.navigationController
        self.window?.makeKeyAndVisible()
        self.coordinator?.start()        
        
        return true
    }
}

