//
//  LoginController.swift
//  GameOFChats
//
//  Created by Berkat Bhatti  on 6/17/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController{
   
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
        button.addTarget(self, action: #selector(handleLoginRegister), for: UIControlEvents.touchUpInside)
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
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profileimage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageTap)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    let loginSegmanetedControl : UISegmentedControl = {
        let SC = UISegmentedControl(items: ["login", "Register"])
        SC.translatesAutoresizingMaskIntoConstraints = false
        SC.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        SC.selectedSegmentIndex = 1
        SC.addTarget(self, action: #selector(didSelectLoginToggle), for: UIControlEvents.valueChanged)
        return SC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(inputCOntainerView)
        view.addSubview(loginRegister)
        view.addSubview(profileImageView)
        view.addSubview(loginSegmanetedControl)
        setupINputCOntainerView()
        setupLoginregisterButton()
        setupProfileView()
        setupLoginRegisterSegmentedView()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//-----------------Selectors

    @objc func didSelectLoginToggle() {
        let title = loginSegmanetedControl.titleForSegment(at: loginSegmanetedControl.selectedSegmentIndex)
        loginRegister.setTitle(title, for: UIControlState.normal)
        InputContainerHeightAncorConstraint?.constant = loginSegmanetedControl.selectedSegmentIndex == 0 ? 100 : 150
        nametextfieldHeightAncor?.isActive = false
        nametextfieldHeightAncor = nameTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: loginSegmanetedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nametextfieldHeightAncor?.isActive = true
        emailtextfieldHeightAncor?.isActive = false
        emailtextfieldHeightAncor = emailTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: loginSegmanetedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailtextfieldHeightAncor?.isActive = true
        passwordtextfieldHeightAncor?.isActive = false
        passwordtextfieldHeightAncor = PasswordTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: loginSegmanetedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordtextfieldHeightAncor?.isActive = true
        
        //Set cod to handle height of container view
    }
    @objc func handleLoginRegister() {
        if loginSegmanetedControl.selectedSegmentIndex ==  0 {
            handleLogin()
        } else {
            handleRegisterTap()
        }
    }
    @objc func handleLogin() {
        guard let email = emailTextfield.text, emailTextfield.text != "" else {return}
        guard let password = PasswordTextfield.text, PasswordTextfield.text != "" else {return}

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                guard let errorMessage = AuthErrorCode(rawValue: error!._code) else {return}
                switch errorMessage {
                case .wrongPassword:
                    print("Wrong Password")
                case .invalidEmail:
                    print("INnvalid Email")
                default:
                    print("invalid login credentials")
                }
            } else {
                self.dismiss(animated: true, completion: nil)
                print("User LOgged iN")
                
            }
        }
        
    }
    @objc func handleRegisterTap() {
        guard let name = nameTextfield.text, nameTextfield.text != "" else {return}
        guard let email = emailTextfield.text, emailTextfield.text != "" else {return}
        guard let password = PasswordTextfield.text, PasswordTextfield.text != "" else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                guard let errorList = AuthErrorCode(rawValue: error!._code) else {return}
                switch errorList {
                case .emailAlreadyInUse:
                    print("Email in use")
                case .weakPassword:
                    print("Weak Password")
                case .wrongPassword:
                    print("wrong password")
                default:
                    print("Invalid login credentials")
                }
            }else {
                //Reguster user with Image
                let ImageData = UIImageJPEGRepresentation(self.profileImageView.image!, 0.3)
                let randomImageName = NSUUID().uuidString
                DataService.instance.storage_Ref_Profile.child("\(randomImageName).png").putData(ImageData!, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error!)
                    } else {    
                        guard let imageURL = metadata?.downloadURL()?.absoluteString else {return}
                            let userData = ["userImageURL" : imageURL, "email": email, "Username": name, "Provider": (Auth.auth().currentUser?.providerID)!] as [String: Any]
                            DataService.instance.addUsertoDatabase(uid: currentuserID, userData: userData)
                            print("User Created")
                            self.dismiss(animated: true, completion: nil)
                    }
                })
                
              
            }
        }
    }
    
    
//------------------------View function below
    var InputContainerHeightAncorConstraint: NSLayoutConstraint?
    var nametextfieldHeightAncor: NSLayoutConstraint?
    var emailtextfieldHeightAncor: NSLayoutConstraint?
    var passwordtextfieldHeightAncor: NSLayoutConstraint?


    
    
    func setupINputCOntainerView() {
        //Need x, y, width, height contrraints
        inputCOntainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputCOntainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputCOntainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        InputContainerHeightAncorConstraint = inputCOntainerView.heightAnchor.constraint(equalToConstant: 150)
        InputContainerHeightAncorConstraint?.isActive = true
        
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
        nametextfieldHeightAncor = nameTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3)
        nametextfieldHeightAncor?.isActive = true
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
        emailtextfieldHeightAncor = emailTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3)
        emailtextfieldHeightAncor?.isActive = true
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
         passwordtextfieldHeightAncor = PasswordTextfield.heightAnchor.constraint(equalTo: inputCOntainerView.heightAnchor, multiplier: 1/3)
        passwordtextfieldHeightAncor?.isActive = true
    }
    func setupLoginRegisterSegmentedView() {
        // Need x, y, width, height contrraints
        loginSegmanetedControl.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        loginSegmanetedControl.centerYAnchor.constraint(equalTo: inputCOntainerView.topAnchor, constant: -30).isActive = true
        loginSegmanetedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        loginSegmanetedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true


    }
    func setupProfileView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginSegmanetedControl.topAnchor, constant: -40).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }

}
