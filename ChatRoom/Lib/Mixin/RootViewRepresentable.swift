//
//  RootViewRepresentable.swift
//  Squares
//
//  Created by Yevhen Triukhan on 12/31/18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

import UIKit

protocol RootViewRepresentable: class {
    
    associatedtype RootView
    
    var rootView: RootView? { get }
}

extension RootViewRepresentable where Self: UIViewController {
    
    var rootView: RootView? {
        return when(self.isViewLoaded) { cast(self.view) }
    }
}
