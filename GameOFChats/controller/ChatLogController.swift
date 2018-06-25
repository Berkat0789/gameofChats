//
//  ChatLogController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/23/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class ChatlogController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.title = "Chat log"
        setupinputCOntainer()
        setupTableView()
        
    }
    
    
    
    func setupinputCOntainer() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = #colorLiteral(red: 0.2862113416, green: 0.7851259112, blue: 0.785114944, alpha: 1)
        view.addSubview(containerView)
        //COntraints 9 x,y,w,h
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTableView() {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = #colorLiteral(red: 0.7741551995, green: 0.2030585706, blue: 0.204862982, alpha: 1)
        view.addSubview(tableview)
        
        //constraints for table view
        
        tableview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableview.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor).isActive = true
        tableview.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor).isActive = true
        
    }
}
