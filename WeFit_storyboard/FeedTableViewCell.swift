//
//  FeedTableViewCell.swift
//  WeFit_storyboard
//
//  Created by Cristina Barclay on 2/25/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var Goal: UILabel!
    @IBOutlet weak var Completion: UIImageView!
    @IBOutlet weak var GoalIcon: UIImageView!
    @IBOutlet weak var GoalDescrip: UILabel!
    @IBOutlet weak var Badge: UIImageView!
    @IBOutlet weak var Like: UIButton!
    @IBOutlet weak var Comment: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
