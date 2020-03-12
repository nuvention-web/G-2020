//
//  PostTableViewCell.swift
//  twotableviews
//
//  Created by Cristina Barclay on 3/3/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var Create: UIButton!
    
    @IBOutlet weak var New: UITextField!
    
    @IBOutlet weak var Title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
