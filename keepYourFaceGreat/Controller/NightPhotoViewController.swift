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
        let UIImagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            UIImagePicker.allowsEditing = true
            UIImagePicker.sourceType = .camera
            UIImagePicker.delegate = self
            self.present(UIImagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.originalImage] as? UIImage != nil {
            let nightImage = info[.originalImage] as! UIImage
            nightPhotoImageView.image = nightImage
            UIImageWriteToSavedPhotosAlbum(nightImage, nil, nil, nil)
            picker.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func didTapAccessLibrary(_ sender: UIButton) {
    }
}
