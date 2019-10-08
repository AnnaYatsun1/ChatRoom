//
//  RootView.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit


class MainView: UIView {
    
    struct Constants {
        static var textFieldsPadding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
    }
    
    func prepareLayer(control: UIControl?) {
        control?.layer.borderColor = UIColor.white.cgColor
        control?.layer.borderWidth = 2.0
        control?.layer.cornerRadius = 20
    }
    
    func prepareStyle() {
        
    }
    
    func add(padding: UIEdgeInsets, to textFields: [TextFieldWithPadding?]) {
        textFields.forEach {
            $0?.padding = padding
        }
    }
}
