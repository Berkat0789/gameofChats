//
//  Dataservice.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/18/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let dbReference = Database.database().reference()

class DataSevice {
    static let instance = DataSevice()
    //Set variable for db references
    
    private(set) public var FirebaseReference = dbReference
    private(set) public var FirebaseReference_Users = dbReference.child("Users")

    //Add user to DB
    func AddUsertoDB(userID: String, email: String, completed: @escaping (_ completed: Bool) -> ()) {
        FirebaseReference_Users.updateChildValues(["email": email, "userID": userID])
        completed(true)
    }
}
