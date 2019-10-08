//
//  DispatchTime+Delay.swift
//  Carwash
//
//  Created by Yevhen Triukhan on 10/31/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

extension DispatchTime {
    
    public static func after(interval: TimeInterval) -> DispatchTime {
        return .now() + interval
    }
    
    public static func afterRandomInterval(in range: Range<Double>) -> DispatchTime {
        return self.after(interval: .random(in: range))
    }
    
    public static func afterRandomInterval(in range: ClosedRange<Double>) -> DispatchTime {
        return self.after(interval: .random(in: range))
    }
}
