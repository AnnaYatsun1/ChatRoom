//
//  LogingView.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


class LoginView: MainView {
    
    @IBOutlet var loginTextField: TextFieldWithPadding?
    @IBOutlet var passwordtextField: TextFieldWithPadding?
    @IBOutlet var loginButton: UIButton?
    @IBOutlet var registerButton: UIButton?
    
    let disposeBag = DisposeBag()
    
    override func prepareStyle() {
        [self.loginButton, self.registerButton, self.loginTextField, self.passwordtextField].forEach {
            self.prepareLayer(control: $0)
        }
       
        self.add(padding: Constants.textFieldsPadding, to: [self.loginTextField, self.passwordtextField])
        self.loginTextField?.setMax(length: 40)
        self.passwordtextField?.setMax(length: 30)
    }
    
    func setMaxSizeTotextFields(textField: UITextField?, length: Int ) {
        textField?.rx.controlEvent(.editingChanged).subscribe(onNext: { 
           textField?.text.do { text in
                textField?.text = String(text.prefix(length))
            }
        }).disposed(by: self.disposeBag)
    }
}
