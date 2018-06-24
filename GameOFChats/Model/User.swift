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
    private(set) public var ProfileImgURl: String?


    init(name: String, email: String, profileURL: String) {
        self.userName = name
        self.Email = email
        self.ProfileImgURl = profileURL
    }
}
