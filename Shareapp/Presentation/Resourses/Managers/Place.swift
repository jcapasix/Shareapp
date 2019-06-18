//
//  Place.swift
//  Shareapp
//
//  Created by Jordan Capa on 6/17/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Place {
    let imagePath: String
    let description: String
    let createdAt: String
    
    // Standard init
    init(imagePath: String, description: String, createdAt:String) {
        self.imagePath = imagePath
        self.description = description
        self.createdAt = createdAt
    }
    
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        imagePath = snapshotValue["imagePath"] as! String
        description = snapshotValue["description"] as! String
        createdAt = snapshotValue["createdAt"] as! String
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            "imagePath": imagePath,
            "description": description,
            "createdAt": createdAt
        ]
    }
}
