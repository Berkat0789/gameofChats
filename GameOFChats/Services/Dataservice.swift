//
//  Dataservice.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/18/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

let Firebase_DB_Reference = Database.database().reference()

class DataService {
    static let instance = DataService()
    //Set variable for db references
    
    private(set) public var Firebase_REference = Firebase_DB_Reference
    private(set) public var Firebase_REference_users = Firebase_DB_Reference.child("user")

    //Add user to DB
    func addUsertoDatabase(uid: String, userData: Dictionary<String, Any>) {
        Firebase_REference_users.child(uid).updateChildValues(userData)
    }
    
//Func get all users
    func getAllUsers(completed: @escaping (_ user: [User]) -> ()) {
        var allUsers = [User]()
        Firebase_REference_users.observeSingleEvent(of: DataEventType.value) { (userSnap) in
            guard let userSnap = userSnap.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnap {
                let userName = user.childSnapshot(forPath: "Username").value as! String
                let email = user.childSnapshot(forPath: "email").value as! String
                let users = User(name: userName, email: email)
                allUsers.append(users)
            }
            completed(allUsers)
        }
    }
    
//get user name for current user
    func getUsernameFOrCurrentUSer(uid: String, completed: @escaping (_ username: String) -> ()) {
        var currentUserName: String!
        Firebase_REference_users.child(uid).observeSingleEvent(of: DataEventType.value) { (userSnap) in
            guard let dictionary = userSnap.value as? [String: Any] else {return}
            let username = dictionary["Username"] as! String
            currentUserName = username
            completed(currentUserName)

            }
        }
    
    
    
}
