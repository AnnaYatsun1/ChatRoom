//
//  MessageInputView.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 04/10/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import SnapKit

class MessageInputView: MainView {
    
    @IBOutlet var contentView: UIView?
    @IBOutlet var SendButton: UIButton?
    @IBOutlet var MessageField: TextFieldWithPadding?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepateVIew()        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepateVIew()
    }
    
    private func prepateVIew() {      
        Bundle.main.loadNibNamed("MessageInputView", owner: self, options: nil)
        self.contentView.do {
            self.addSubview($0)
            self.add(padding: Constants.textFieldsPadding, to: [self.MessageField])
            
            $0.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
        }
    }
}
