//
//  ViewController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logoutPressed))
        
    }
    @objc func logoutPressed() {
        do {
            try Auth.auth().signOut()
            let loginController = LoginController()
            present(loginController, animated: true, completion: nil)
        } catch let error as NSError {
            print(error)
        }
        
    }
  
    
//--Selectors
  


}

