//
//  ViewController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handlelogout))
    }
    
//--Selectors
    @objc func handlelogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }


}

