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
        UIImagePicker.sourceType = .camera
        UIImagePicker.delegate = self
        present(UIImagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let nightImage = info[.originalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(nightImage, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAccessLibrary(_ sender: UIButton) {
    }
}
