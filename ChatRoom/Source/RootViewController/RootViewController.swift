//
//  RootViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


class RootViewController<RootViewType: MainView>: UIViewController, RootViewRepresentable {
    
    typealias RootView = RootViewType
    
    var didChangedController = PublishSubject<Model>()
    
    let model: Model
    let serviceManager: ServiceManager
    
    // add rxSignal with model
    
    init(model: Model, serviceManager: ServiceManager) {
        self.model = model
        self.serviceManager = serviceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView?.prepareStyle()
    }
}
