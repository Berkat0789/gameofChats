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

let dbReference = Database.database().reference()

class DataSevice {
    static let instance = DataSevice()
    //Set variable for db references
    
    private(set) public var FirebaseReference = dbReference
    private(set) public var FirebaseReference_Users = dbReference.child("users")

    //Add user to DB
    func AddUsertoDB(userID: String, username: String, email: String) {
        FirebaseReference_Users.childByAutoId().updateChildValues(["Username": username, "email": email, "userID": userID])
    }
}
