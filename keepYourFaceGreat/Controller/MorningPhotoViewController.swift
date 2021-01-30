//
//  MorningPhotoViewController.swift
//  keepYourFaceGreat
//
//  Created by Owner on 2021/01/04.
//

import UIKit
import FirebaseStorage

class MorningPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var morningPhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapMorningPhotoButton(_ sender: UIButton) {
        uploadImageToFireStore()
    }
    
    @IBAction func didTapAccessCameraButton(_ sender: UIButton) {
        
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
            let morningImage = info[.originalImage] as! UIImage
            morningPhotoImageView.image = morningImage
            UIImageWriteToSavedPhotosAlbum(morningImage, nil, nil, nil)
            picker.dismiss(animated: true, completion: nil)
        }
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
    
    func uploadImageToFireStore(){
        let storage = Storage.storage().reference(forURL: "gs://keepyourfacegreat.appspot.com")
        let imageRef = storage.child("morningPhotoImage").child("\(morningPhotoImageView.image).jpeg")
        var morningPhotoImageData:Data = Data()
        
        if morningPhotoImageView.image != nil {
            morningPhotoImageData = (morningPhotoImageView.image?.jpegData(compressionQuality: 0.01))!
        }
        imageRef.putData(morningPhotoImageData, metadata: nil) { (metaData, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
        }
    }
}
