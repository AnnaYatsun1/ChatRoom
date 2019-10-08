//
//  RegisterViewController.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 19/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class RegisterViewController: RootViewController<RegisterView>, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareRootView()
        self.addTapGetsureRecognizerToProfileImage()
    }
    
    private func prepareRootView() {
        self.rootView?.prepareStyle()
        self.rootView?.loginButton?.addTarget(self, action: #selector(self.handlerMoveToLogin), for: .touchUpInside)
        self.rootView?.registerButton?.addTarget(self, action: #selector(self.handlerDidGegister), for: .touchUpInside)
    }
    
    private func addTapGetsureRecognizerToProfileImage() {
        self.rootView?.profileImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onProfileImageTapAction)))
    }
    
    @objc func handlerMoveToLogin(_sender: UIButton) {
        self.model.state = .loging
        self.didChangedController.onNext(self.model)
    }
    
    @objc func handlerDidGegister(_ sender: UIButton) {
        let rootView = self.rootView
        rootView?.nameTextField?.text.do { name in
            rootView?.emailTextField?.text.do { email in
                rootView?.passwordTextField?.text.do { password in
                    let image = rootView?.profileImageView?.image
                    image.do { image in
                        let model = UserModel(name: name, email: email, password: password, image: image)
                        self.serviceManager.createUser(model: model, completion: self.serviceManager.signOut)
                    }                    
                }
            }
        }
    }

    @objc func onProfileImageTapAction() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedmage: UIImage?
        
        if let image = info[.editedImage] as? UIImage {
            selectedmage = image
        } else if let image = info[.originalImage] as? UIImage {
            selectedmage = image        
        }        
        
        
        selectedmage.do {         
            self.rootView?.profileImageView?.image = $0
        }
        
        self.dismiss(animated: true)
    }
}
