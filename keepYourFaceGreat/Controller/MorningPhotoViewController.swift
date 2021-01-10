//
//  MorningPhotoViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2021/01/04.
//

import UIKit

class MorningPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var morningPhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapMorningPhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapAccessCameraButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapAccessLibraryButton(_ sender: UIButton) {
        let UIImagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            UIImagePicker.sourceType = .photoLibrary
            UIImagePicker.allowsEditing = true
            UIImagePicker.delegate = self
            self.present(UIImagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
