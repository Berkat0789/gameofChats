//
//  User.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/20/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import Foundation


class User {
    
    private(set) public var userName: String?
    private(set) public var Email: String?

    init(name: String, email: String) {
        self.userName = name
        self.Email = email
    }
}