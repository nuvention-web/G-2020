//
//  Rank.swift
//  Slice2WeFit
//
//  Created by Natalia Novoa on 2/25/20.
//  Copyright © 2020 Natalia Novoa. All rights reserved.
//


import Foundation
import UIKit


class Rank {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var streak: UIImage
    var days: String
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, streak: UIImage, days: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.streak = streak
        self.days = days
        
    }
}
