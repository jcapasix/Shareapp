//
//  PlaceTableViewCell.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit
import FirebaseStorage


class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unicornImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var storageRef: StorageReference!
    var storageDownloadTask: StorageDownloadTask!
    
    var place: Place? {
        didSet {
            if let place = place {
                // TODO: Implement image update
                // unicornImageView.image =
                descriptionLabel.text = place.description
            }
        }
    }
    
    func downloadImage(from storageImagePath: String) {
        // 1. Get a filePath to save the image at
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath = "file:\(documentsDirectory)/myimage.jpg"
        // 2. Get the url of that file path
        guard let fileURL = URL(string: filePath) else { return }
        
        // 3. Start download of image and write it to the file url
        storageDownloadTask = storageRef.child(storageImagePath).write(toFile: fileURL, completion: { (url, error) in
            // 4. Check for error
            if let error = error {
                print("Error downloading:\(error)")
                return
                // 5. Get the url path of the image
            } else if let imagePath = url?.path {
                // 6. Update the unicornImageView image
                self.unicornImageView.image = UIImage(contentsOfFile: imagePath)
            }
        })
        // 7. Finish download of image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storageRef = Storage.storage().reference()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        storageDownloadTask.cancel()
        unicornImageView.image = #imageLiteral(resourceName: "unicorn")
        descriptionLabel.text = "description"
    }
    
}
