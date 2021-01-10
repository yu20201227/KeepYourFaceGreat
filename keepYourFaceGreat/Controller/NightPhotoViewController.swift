//
//  NightPhotoViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2021/01/04.
//

import UIKit

class NightPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var nightPhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapNightPhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapAccessCamera(_ sender: UIButton) {
    }
    
    @IBAction func didTapAccessLibrary(_ sender: UIButton) {
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
