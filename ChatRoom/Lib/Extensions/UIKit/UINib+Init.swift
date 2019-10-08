//
//  UINib+Init.swift
//  Weather
//
//  Created by Yevhen Triukhan on 12.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

extension UINib {
    
    public convenience init<View: UIView>(_ viewClass: View.Type, bundle: Bundle? = nil) {
        self.init(nibName: viewClass.className, bundle: bundle)
    }
}
