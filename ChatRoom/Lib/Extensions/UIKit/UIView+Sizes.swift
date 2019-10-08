//
//  UIView+Sizes.swift
//  Squares
//
//  Created by Yevhen Triukhan on 1/10/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

extension UIView {
    
    public var x: CGFloat {
        return self.frame.origin.x
    }
    
    public var y: CGFloat {
        return self.frame.origin.y
    }
    
    public var width: CGFloat {
        return self.frame.width
    }

    public var height: CGFloat {
        return self.frame.height
    }
    
    public static var className: String {
        return String(describing: self)
    }
}


