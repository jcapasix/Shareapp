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
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var storageRef: StorageReference!
    var storageDownloadTask: StorageDownloadTask!
    
    var place: Place? {
        didSet {
            if let place = place {
                downloadImage(from: place.imagePath)
                descriptionLabel.text = place.description
                dateLabel.text = place.createdAt
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
                self.placeImageView.image = UIImage(contentsOfFile: imagePath)
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
        placeImageView.image = #imageLiteral(resourceName: "place_ico")
        descriptionLabel.text = "description"
        dateLabel.text = "createdAt"
    }
    
}
