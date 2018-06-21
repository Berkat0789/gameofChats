//
//  ComposeMessageController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/20/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class ComposeMessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleCancel))
        
    }
    
    //Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    

}
