//
//  AuthentificationService.swift
//  ChatRoom
//
//  Created by Anna Yatsun on 23/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

protocol AuthServiceProtocol {
    func createUser(model: UserModel, completion: @escaping VoidCompletion)
    func signOut()
    func getUser(_ completion: @escaping Completion<UserModel>)
    func loginUser(email: String, password: String, completion: @escaping Completion<UserModel>) 
}

struct Constants {
    static let dataBaseUrl = "https://gameofchats-fbff5.firebaseio.com/"    
}

class AuthService: AuthServiceProtocol {
   
    enum User: String {
        case email = "email"
        case name = "name"
        case profileImgUrl = "profileImgUrl"
        
    }
    
    typealias UserDataType = [String : AnyObject]    
    
    let dataBase = Database.database()
    let auth = Auth.auth()
    let storangeRef = Storage.storage().reference()

    func createUser(model: UserModel, completion: @escaping VoidCompletion) {
        self.auth.createUser(withEmail: model.email, password: model.password, completion: { data, error in
            
            error.do {
                print("create user error \($0)")                
                return
            }
            
            data.do { data in 
                let ref = self.dataBase.reference(fromURL: Constants.dataBaseUrl)                         
                let users = ref.child("users").child(data.user.uid)
                let imageName = NSUUID().uuidString
                let storageRef = self.storangeRef.child("profileImages").child("\(imageName).png")
                
                model.image.pngData().do {
                    storageRef.putData(
                        $0, 
                        metadata: nil, 
                        completion: { metadata, error in
                            error.do {
                                print($0)
                                return
                            }
                            
                            storageRef.downloadURL { url, error in
                                if let url = url?.absoluteString {
                                    let values = [User.name.rawValue : model.name, User.email.rawValue: model.email, User.profileImgUrl.rawValue: url]
                                    
                                    users.updateChildValues(values) { error, ref in 
                                        error.do {
                                            print("error create \($0)")                                                            
                                        }                                        
                                    }
                                } else {
                                    print("Url: nil")
                                }
                            }         
                    })                                          
                }
            }
        })
    }
//    
    func loginUser(email: String, password: String, completion: @escaping Completion<UserModel>) {
            self.auth.signIn(withEmail: email, password: password,  completion: { data, error in
//        
            error.do {
                print("error signIn \($0)")
            }   
            
            self.userModel(email: email, password: password) { userModel in
                completion(userModel)
            }

        })
    }
    
    func getUser(_ completion: @escaping Completion<UserModel>) {
        self
            .dataBase
            .reference()
            .child("users")
            .observe(.childAdded, with: { snapShot in
                self.handle(snapShot: snapShot) { userModel in 
                    completion(userModel)
                }
//                if let dictionary = snapShot.value as? UserDataType {    
//                    let name = dictionary[User.name.rawValue] as? String
//                    let email = dictionary[User.email.rawValue] as? String
//                    let profileImage = dictionary[AuthService.User.profileImgUrl.rawValue] as? String
//                    
//                    
//                    if let profileImageUrl = profileImage {
//                        let url = URL(string: profileImageUrl)
//                        url.do { url in                     
//                            URLSession.shared.dataTask(with: url, completionHandler: { data, responce, error in                    
//                                if error != nil {
//                                    print(error)
//                                }
//                                
//                                data.do { data in 
//                                    name.do { name in
//                                        email.do { email in 
//                                            let image = UIImage(data: data)
//                                            image.do { image in
//                                                let user = UserModel(name: name, email: email, password: "", image: image)
//                                                completion(user)
//                                            } 
//                                        }
//                                                                
//                                    }
//                                }                                    
//                            }).resume()
//                        }
//                    }  
//                   
//                }
            })
    }

    func logout(completion: @escaping Completion<DataSnapshot?>) {
        let uid = self.auth.currentUser?.uid
        uid.map {
            self.dataBase.reference().child("users").child($0).observeSingleEvent(of: .value) {
              completion($0)                
            } 
        }.or {
                self.signOut()
        } 
    }

    func signOut() {
        try? self.auth.signOut()
    }

    private func userModel(email: String, password: String, completion: @escaping Completion<UserModel>) {
        self.logout { data in
            data.do {
                self.handle(snapShot: $0) { userModel in 
                    completion(userModel)
                }
            }
        }
    }
    
   private func handle(snapShot: DataSnapshot, _ completion: @escaping Completion<UserModel>) {
        if let dictionary = snapShot.value as? UserDataType {    
            let name = dictionary[User.name.rawValue] as? String
            let email = dictionary[User.email.rawValue] as? String
            let profileImage = dictionary[AuthService.User.profileImgUrl.rawValue] as? String
            
            
            if let profileImageUrl = profileImage {
                let url = URL(string: profileImageUrl)
                url.do { url in                     
                    URLSession.shared.dataTask(with: url, completionHandler: { data, responce, error in                    
                        if error != nil {
                            print(error)
                        }
                        
                        data.do { data in 
                            name.do { name in
                                email.do { email in 
                                    let image = UIImage(data: data)
                                    image.do { image in
                                        let user = UserModel(name: name, email: email, password: "", image: image)
                                        completion(user)
                                    } 
                                }
                                
                            }
                        }                                    
                    }).resume()
                }
            }  
            
        }  
    } 
}
