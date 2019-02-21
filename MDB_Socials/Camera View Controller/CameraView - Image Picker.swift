//
//  CameraView - Image Picker.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension CameraView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func imagePickerController(_ picker: UIImagePickerController,
                                     didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage {
            print("SUCCESSFULY PICKED IMAGE")
            self.image = pickedImage
            dismiss(animated: true, completion: pickedPhoto)
        } else {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
}
