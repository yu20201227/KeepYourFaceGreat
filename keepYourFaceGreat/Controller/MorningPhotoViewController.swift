//
//  MorningPhotoViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2021/01/04.
//

import UIKit

class MorningPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var morningPhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapMorningPhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapAccessCameraButton(_ sender: UIButton) {
        let UIImagePicker = UIImagePickerController()
        UIImagePicker.sourceType = .camera
        UIImagePicker.delegate = self
        present(UIImagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let morningImage = info[.originalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(morningImage, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAccessLibraryButton(_ sender: UIButton) {
    }
}
