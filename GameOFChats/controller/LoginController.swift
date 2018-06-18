//
//  LoginController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    let loginButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitle("Register", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let containerView: UIView = {
        let inputcontainerView = UIView()
        inputcontainerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return inputcontainerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerView()
        setuploginRegisterButton()
        
    }
    
    
    
//-----Change status bar to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//---------update view fuction
    func setupContainerView() {
        //color background
        view.backgroundColor = #colorLiteral(red: 0.4754953023, green: 0.7725490196, blue: 1, alpha: 1)
        
        
        //Constatints for container view
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
        view.addSubview(containerView)


    }
    
    func setuploginRegisterButton () {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50)
        view.addSubview(loginButton)
    }
   


}
