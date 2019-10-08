//
//  UserListViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 26/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class UserListViewController: RootTableViewController {
    
    let dataSource: UserListDataSource
    let disposeBag = DisposeBag()
    
    init(dataSource: UserListDataSource, userModel: UserModel) {
        self.dataSource = dataSource        
        super.init(userModel: userModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        self.tableView.dataSource = self.dataSource
        self.tableView.register(UserListViewCell.self)
        
        self
            .userModel
            .needReloadCell
            .observeOn(MainScheduler.asyncInstance)
            .bind(onNext: { [weak self] in
                self?.tableView.reloadData()
            })
            .disposed(by: self.disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chtViewController = ChatViewController.init(collectionViewLayout: UICollectionViewLayout())
        self.navigationController?.pushViewController(chtViewController, animated: false)
    }
}

