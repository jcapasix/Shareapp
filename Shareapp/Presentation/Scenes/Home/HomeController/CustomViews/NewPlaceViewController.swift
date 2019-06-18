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

class NewPlaceViewController: UIViewController {

    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func didTapSubmit(_ sender: UIButton) {
        // Get properties for the unicorn-to-be-created
        let description = self.descriptionTextField.text ?? ""
        let place = Place(imagePath: storageImagePath, description: description)
        
        // Create the unicorn and record it
        writePlaceToDatabase(place)
        
        // Return to Unicorns Table VC
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - Variables
    fileprivate let picker = UIImagePickerController()
    fileprivate var storageImagePath = ""
    fileprivate var ref: DatabaseReference!
    fileprivate var storageRef: StorageReference!
    fileprivate var storageUploadTask: StorageUploadTask!
    
    // Setup for activity indicator to be shown when uploading image
    fileprivate var showNetworkActivityIndicator = false {
        didSet {
            UIApplication.shared.isNetworkActivityIndicatorVisible = showNetworkActivityIndicator
        }
    }
    
    // MARK: - Functions
    fileprivate func writePlaceToDatabase(_ place: Place) {
        // Access the "unicorns" child reference and then access (create) a unique child reference within it and finally set its value
        ref.child("places").child(place.description + "\(Int(Date.timeIntervalSinceReferenceDate * 1000))").setValue(place.toAnyObject())
    }
    
    fileprivate func uploadSuccess(_ storagePath: String, _ storageImage: UIImage) {
        
        // Update the unicorn image view with the selected image
        placeImageView.image = storageImage
        // Updated global variable for the storage path for the selected image
        storageImagePath = storagePath
        
        // Enable submit button and change its color
        submitButton.isEnabled = true
        submitButton.backgroundColor = .green
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup references for database and for storage
        ref = Database.database().reference()
        storageRef = Storage.storage().reference()
        
        // Submit button should be disable initially
        submitButton.isEnabled = false
        submitButton.backgroundColor = .gray
        
        picker.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // If VC is popping, stop showing networking activity indicator and cancel storageUploadTask if any
        if self.isMovingFromParent {
            showNetworkActivityIndicator = false
            storageUploadTask?.cancel()
        }
    }
    

}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        // 1. Get image data from selected image
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let imageData = UIImage.jpegData(image) else {
                print("Could not get Image JPEG Representation")
                return
        }
        
        // 2. Create a unique image path for image. In the case I am using the googleAppId of my account appended to the interval between 00:00:00 UTC on 1 January 2001 and the current date and time as an Integer and then I append .jpg. You can use whatever you prefer as long as it ends up unique.
        let imagePath = Auth.auth().app!.options.googleAppID + "/\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        
        // 3. Set up metadata with appropriate content type
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // 4. Show activity indicator
        showNetworkActivityIndicator = true
        
        // 5. Start upload task
        storageUploadTask = storageRef.child(imagePath).putData(imageData, metadata: metadata) { (_, error) in
            // 6. Hide activity indicator because uploading is done with or without an error
            self.showNetworkActivityIndicator = false
            
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
