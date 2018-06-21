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

class MessageHomeVC: UITableViewController{
    
    //Variables and arrays
    var cellID = "UserCells"

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
            DataService.instance.getUsernameFOrCurrentUSer(uid: currentuserID) { (returnedUserName) in
                self.navigationItem.title = returnedUserName
            }
        }
    }
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        }catch let error as NSError {
            print(error)
        }
        let logincontrollerVC = LoginController()
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
    
    @objc func handleNewMessagepressed() {
       let ComposeMessageVC = ComposeMessageController()
        let navController = UINavigationController(rootViewController: ComposeMessageVC)
        present(navController, animated: true, completion: nil)
        
    }
  


}

