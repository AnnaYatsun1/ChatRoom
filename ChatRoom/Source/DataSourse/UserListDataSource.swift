//
//  UserListDataSource.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 03/10/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit


class UserListDataSource: NSObject {
    
    private let serviceManager: ServiceManager
    private let model: UserModel
    
    private var models = [UserModel]() {
        willSet {
            if self.models.count != newValue.count {
                self.model.needReloadCell.onNext()
            }            
        }
    }
    
    // MARK: - Initialization
    
    init(model: UserModel, serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
        self.model = model
        
        super.init()
        
        self.serviceManager.getUser { [weak self] in
            self?.models.append($0)
        }
    }
}

extension UserListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.reusableCell(cellClass: UserListViewCell.self, for: indexPath) { cell in
            let model = self.models[indexPath.row]
            
            cell.fill(userModel: model) 
        }
    }
}
