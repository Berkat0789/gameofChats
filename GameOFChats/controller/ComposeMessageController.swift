//
//  ComposeMessageController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/20/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import SDWebImage

class ComposeMessageController: UITableViewController, NSURLConnectionDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserCell
        let user = Users[indexPath.row]
        cell.textLabel?.text = user.userName
        cell.detailTextLabel?.text = user.Email
        cell.profileImageView.sd_setImage(with: URL(string: user.ProfileImgURl!), placeholderImage: UIImage(named: "Profileimage"), options: [SDWebImageOptions.progressiveDownload, SDWebImageOptions.continueInBackground]) { (image, error, cache, url) in
            self.profileImageView.image = image
        }
        return cell

}
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

class UserCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        
        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        
        //ios 9 constraint anchors
        //need x,y,width,height anchors
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  }
}
