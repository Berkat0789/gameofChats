//
//  LoginController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
   
    let inputCOntainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginRegister: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        button.setTitle("Register", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.addTarget(self, action: #selector(handleRegisterTap), for: UIControlEvents.touchUpInside)
        return button
    }()
    let nameTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        return tf
    }()
    let emailTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        return tf
    }()
    let PasswordTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    let nameSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let EmailSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Profileimage")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(inputCOntainerView)
        view.addSubview(loginRegister)
        view.addSubview(profileImageView)
        setupINputCOntainerView()
        setupLoginregisterButton()
        setupProfileView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//-----------------Selectors
    @objc func handleRegisterTap() {
        guard let name = nameTextfield.text, nameTextfield.text != "" else {return}
        guard let email = emailTextfield.text, emailTextfield.text != "" else {return}
        guard let password = PasswordTextfield.text, PasswordTextfield.text != "" else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (completed, error) in
            if error != nil {
                print ("There has been an error")
            } else {
                DataSevice.instance.FirebaseReference_Users.updateChildValues(["Username": name, "email": email])
            }
        }
        
    }
    
    
//------------------------View function below
    
    func setupINputCOntainerView() {
        //Need x, y, width, height contrraints
        inputCOntainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputCOntainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputCOntainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputCOntainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputCOntainerView.layer.cornerRadius = 8
        inputCOntainerView.clipsToBounds = true
        //Setup name textfield XYWH
        inputCOntainerView.addSubview(nameTextfield)
        inputCOntainerView.addSubview(nameSeperator)
        inputCOntainerView.addSubview(emailTextfield)
        inputCOntainerView.addSubview(EmailSeperator)
        inputCOntainerView.addSubview(PasswordTextfield)
        setupNameTextfield()
        setupnameSeperator()
        setupEmailTextfield()
        setupEmailSeperator()
        setuppPasswordTextfield()

       
    }
    
    func setupLoginregisterButton() {
        loginRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegister.topAnchor.constraint(equalTo: inputCOntainerView.bottomAnchor, constant: 12).isActive = true
        loginRegister.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        loginRegister.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func setupNameTextfield() {
        nameTextfield.leftAnchor.constraint(equalTo: inputCOntainerView.leftAnchor, constant: 12).isActive = true
        nameTextfield.topAnchor.constraint(equalTo: inputCOntainerView.topAnchor).isActive = true
        nameTextfield.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        nameTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    func setupnameSeperator() {
        nameSeperator.leftAnchor.constraint(equalTo: inputCOntainerView.leftAnchor).isActive = true
        nameSeperator.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor).isActive = true
        nameSeperator.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        nameSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    func setupEmailTextfield() {
        emailTextfield.leftAnchor.constraint(equalTo: inputCOntainerView.leftAnchor, constant: 12).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: nameSeperator.bottomAnchor).isActive = true
        emailTextfield.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        emailTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    func setupEmailSeperator() {
        EmailSeperator.leftAnchor.constraint(equalTo: inputCOntainerView.leftAnchor).isActive = true
        EmailSeperator.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        EmailSeperator.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        EmailSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    func setuppPasswordTextfield() {
        PasswordTextfield.leftAnchor.constraint(equalTo: inputCOntainerView.leftAnchor, constant: 12).isActive = true
        PasswordTextfield.topAnchor.constraint(equalTo: EmailSeperator.bottomAnchor).isActive = true
        PasswordTextfield.widthAnchor.constraint(equalTo: inputCOntainerView.widthAnchor).isActive = true
        PasswordTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    func setupProfileView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputCOntainerView.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}
