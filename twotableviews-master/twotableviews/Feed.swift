//
//  Feed.swift
//  WeFit_storyboard
//
//  Created by Cristina Barclay on 2/25/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Feed {
    
    //MARK: Properties
    
    var name: String
    var id: String
    var photo: UIImage?
    var goal: String
    var completion: UIImage
    var numberOfLikes:Int
    var hasLiked:Bool
    
    //MARK: Initialization
    
    init?(id: String, name: String, photo: UIImage?, goal: String, completion: UIImage, numberOfLikes:Int = 0, hasLiked: Bool = false) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively
        
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.photo = photo
        self.goal = goal
        self.completion = completion
        self.numberOfLikes = numberOfLikes
        self.hasLiked = hasLiked
    }
}
