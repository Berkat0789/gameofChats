//
//  MessageHomeVC.Swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SDWebImage

class MessageHomeVC: UITableViewController{
    
    //Variables and arrays
    var cellID = "UserCells"
    var loggedinUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleLogout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleNewMessagepressed))
        
      checkifuserisLogggedIn()
        
    }
    func checkifuserisLogggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserData()
        }
    }
    
    func fetchUserData() {
        DataService.instance.Firebase_REference_users.observe(DataEventType.value) { (userSnap) in
            DataService.instance.getuserDatafor(uid: currentuserID, completed: { (returnedUser) in
                self.loggedinUser = returnedUser
                self.setupnavbarwith(user: self.loggedinUser!)
            })
        }
    }
    
    func setupnavbarwith(user: User) {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        titleView.backgroundColor = #colorLiteral(red: 0.7741551995, green: 0.2030585706, blue: 0.204862982, alpha: 1)
        

//        let profileImageview = UIImageView()
//        profileImageview.clipsToBounds = true
//        profileImageview.contentMode = .scaleAspectFill
//        profileImageview.layer.cornerRadius = 20
//        profileImageview.translatesAutoresizingMaskIntoConstraints = false
//        profileImageview.isUserInteractionEnabled = true
//        profileImageview.sd_setImage(with: URL(string: (user.ProfileImgURl)!), placeholderImage: UIImage(named: ""), options: SDWebImageOptions.progressiveDownload, completed: nil)
//        titleView.addSubview(profileImageview)
//
//
//
//        //ios 9 constraints
//        //x,y,w,h
//
//        profileImageview.leftAnchor.constraint(equalTo: titleView.leftAnchor).isActive = true
//        profileImageview.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
//        profileImageview.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        profileImageview.heightAnchor.constraint(equalToConstant: 40).isActive = true

        self.navigationItem.titleView = titleView
        
        //trigger segue to message thread
        
        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTitleViewPRessedtposhowChatView)))

        
        
        
    }
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        }catch let error as NSError {
            print(error)
        }
        let logincontrollerVC = LoginController()
        logincontrollerVC.messageController = self
        present(logincontrollerVC, animated: true, completion: nil)
    }
    
//Table view protocol functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = "Blabujbfubg"
        return cell
    }
  
    
//--Selectors
    @objc func handleTitleViewPRessedtposhowChatView() {
        let chatlogcontroller = ChatlogController()
        navigationController?.pushViewController(chatlogcontroller, animated: true)
    }
    
    @objc func handleNewMessagepressed() {
       let ComposeMessageVC = ComposeMessageController()
        let navController = UINavigationController(rootViewController: ComposeMessageVC)
        present(navController, animated: true, completion: nil)
        
    }
  


}

