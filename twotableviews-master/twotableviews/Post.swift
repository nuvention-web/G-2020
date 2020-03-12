//
//  Post.swift
//  WeFit_storyboard
//
//  Created by Cristina Barclay on 2/25/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import Foundation
import UIKit


class Post {
    
    //MARK: Properties
    
    var title: String
    
    //MARK: Initialization
    init?(title: String) {
           
           // The name must not be empty
           guard !title.isEmpty else {
               return nil
           }
   
        // Initialize stored properties.
    self.title = title
        
    }
}

