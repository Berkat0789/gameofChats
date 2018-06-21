//
//  LoginController_EXTs.swift
//  GameOFChats
//
//  Created by berkat bhatti on 6/21/18.
//  Copyright © 2018 Berkat Bhatti . All rights reserved.
//

import UIKit

extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//Handles tap on image picker for login
      @objc func handleImageTap() {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage?
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            selectedImage = editedImage
        } else {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            selectedImage = image
        }
        self.dismiss(animated: true, completion: nil)
        profileImageView.image = selectedImage
        
    }
}
