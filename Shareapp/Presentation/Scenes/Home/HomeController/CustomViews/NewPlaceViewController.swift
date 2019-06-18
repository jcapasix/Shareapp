//
//  NewPlaceViewController.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage
import SVProgressHUD

class NewPlaceViewController: UIViewController {

    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    fileprivate let picker = UIImagePickerController()
    fileprivate var storageImagePath = ""
    fileprivate var ref: DatabaseReference!
    fileprivate var storageRef: StorageReference!
    fileprivate var storageUploadTask: StorageUploadTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        storageRef = Storage.storage().reference()
        submitButton.isEnabled = false
        submitButton.backgroundColor = .gray
        picker.delegate = self
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.closeButtonPressed))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            SVProgressHUD.dismiss()
            storageUploadTask?.cancel()
        }
    }
    
    @IBAction func didTapSubmit(_ sender: UIButton) {
        
        
        let description = self.descriptionTextField.text ?? ""
        let place = Place(imagePath: storageImagePath, description: description, createdAt: Utils.getDateSrting())
        writePlaceToDatabase(place)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    // MARK: - Functions
    fileprivate func writePlaceToDatabase(_ place: Place) {
        ref.child("places").child(place.description + "\(Int(Date.timeIntervalSinceReferenceDate * 1000))").setValue(place.toAnyObject())
    }
    
    fileprivate func uploadSuccess(_ storagePath: String, _ storageImage: UIImage) {
        
        placeImageView.image = storageImage
        storageImagePath = storagePath
        submitButton.isEnabled = true
        submitButton.backgroundColor = .green
    }
    
    
    
    @objc func closeButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    

}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let imageData = image.jpegData(compressionQuality: 0.75) else {
                print("Could not get Image JPEG Representation")
                return
        }
        
        let imagePath = Auth.auth().app!.options.googleAppID + "/\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        SVProgressHUD.show()
        storageUploadTask = storageRef.child(imagePath).putData(imageData, metadata: metadata) { (_, error) in
            SVProgressHUD.dismiss()
            guard error == nil else {
                print("Error uploading: \(error!)")
                return
            }
            self.uploadSuccess(imagePath, image)
        }
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
