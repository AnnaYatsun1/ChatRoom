//
//  UITableView+Extensions.swift
//  Weather
//
//  Created by Yevhen Triukhan on 12.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(_ cell: Cell.Type) {
        self.register(UINib(cell), forCellReuseIdentifier: cell.className)
    }

    func register<Cell: UITableViewCell>(_ cells: [Cell.Type]) {
        cells.forEach {
            self.register($0)
        }
    }
    
//    func dequeueReusableCell<Cell: UITableViewCell>(cellClass: Cell.Type) -> UITableViewCell? {
//        return self.dequeueReusableCell(withIdentifier: cellClass.className)
//    }
    
    func reusableCell<Cell: UITableViewCell>(cellClass: Cell.Type, for indexPath: IndexPath, configure: Closure.Execute<Cell>? = nil) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: cellClass.className, for: indexPath)
        cast(cell).apply(configure)
        
        return cell
    }
}



extension UICollectionView {
    

    
    func reusableCell<Cell: UICollectionViewCell>(cellClass: Cell.Type, for indexPath: IndexPath, configure: Closure.Execute<Cell>? = nil)  -> UICollectionViewCell{
    
    
        let cell = self.dequeueReusableCell(withReuseIdentifier: cellClass.className, for: indexPath)
        cast(cell).apply(configure)
        
        return cell
    }
    
    func register<Cell: UICollectionViewCell>(_ cells: [Cell.Type]) {
        cells.forEach {
            self.register($0, forCellWithReuseIdentifier: String(describing: cells.self))
        }
    }
    

    ///Registering cell from nib for its self class
//        func register(cellClass: AnyClass) {
//            self.register(UINib.nib(withClass: cellClass), forCellWithReuseIdentifier: String(describing: cellClass.self))
//        }
    
}
