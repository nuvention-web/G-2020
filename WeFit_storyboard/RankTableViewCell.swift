//
//  RankTableViewCell.swift
//  Slice2WeFit
//
//  Created by Natalia Novoa on 2/25/20.
//  Copyright © 2020 Natalia Novoa. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    //Mark: Properties
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var streak: UIImageView!
    @IBOutlet weak var days: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
