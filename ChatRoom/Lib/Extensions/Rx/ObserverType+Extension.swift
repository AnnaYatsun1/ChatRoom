//
//  ObserverType+Extension.swift
//  LiveStream
//
//  Created by Anna Yatsun on 09/08/2019.
//  Copyright © 2019 Student. All rights reserved.
//
//
import RxSwift
import RxCocoa

extension ObserverType 
    where Self.E == Void {
    
    func onNext() {
        self.onNext(())
    }    
}


