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

        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath = "file:\(documentsDirectory)/myimage.jpg"
        guard let fileURL = URL(string: filePath) else { return }
        
        storageDownloadTask = storageRef.child(storageImagePath).write(toFile: fileURL, completion: { (url, error) in
            if let error = error {
                print("Error downloading:\(error)")
                return
            } else if let imagePath = url?.path {
                self.unicornImageView.image = UIImage(contentsOfFile: imagePath)
            }
        })
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
