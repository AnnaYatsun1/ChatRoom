//
//  TextFieldWithPadding.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

class TextFieldWithPadding: UITextField {
    
    var padding: UIEdgeInsets?    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.padding.map { bounds.inset(by: $0) } ?? bounds
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return self.padding.map { bounds.inset(by: $0) } ?? bounds
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.padding.map { bounds.inset(by: $0) } ?? bounds
    }
}

