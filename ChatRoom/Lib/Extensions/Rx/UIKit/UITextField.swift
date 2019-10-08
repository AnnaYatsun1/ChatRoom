//
//  UITextField.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 24/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


extension UITextField {
    func setMax(length: Int) {
        let disposeBag = DisposeBag()
        self
            .rx
            .controlEvent(.editingChanged)
            .subscribe(onNext: { 
                self.text.do { text in
                    self.text = String(text.prefix(length))
                }
            })
            .disposed(by: disposeBag)
    }
}
