//
//  ComposeMessageController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/20/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class ComposeMessageController: UITableViewController {
    
    let cellIdentifier = "ComposeCell"
    var Users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleCancel))
        tableView.register(UserCell.self, forCellReuseIdentifier: cellIdentifier)
        DataService.instance.getAllUsers { (returnedUsers) in
            self.Users = returnedUsers
            //user ditchpatch to to prevent crash from background thred
            self.tableView.reloadData()
        }
    }
    
    //Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    //--Protocol comforming functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let user = Users[indexPath.row]
        cell.textLabel?.text = user.userName
        cell.detailTextLabel?.text = user.Email
        return cell
    }

}

class UserCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
