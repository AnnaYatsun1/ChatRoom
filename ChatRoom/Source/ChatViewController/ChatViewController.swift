//
//  ChatViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 04/10/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "Cell"

class ChatViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.createTextView()

    }


//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//    
//        return cell
//    }
//    
    func createTextView() {
        let textView = MessageInputView()
        self.view.addSubview(textView)
        
        textView.snp.makeConstraints { maker in 
            maker.left.right.bottom.equalToSuperview()
            maker.height.equalTo(70)
        }
    }
}
