//
//  FeedTableViewCell.swift
//  twotableviews
//
//  Created by Cristina Barclay on 3/3/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit

protocol FeedTableViewCellProtocol:class {
    func likeButtonTapped(indexPath:IndexPath)
}
class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    
    
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var Goal: UILabel!
    weak var delegate:FeedTableViewCellProtocol?
    
    @IBOutlet weak var Completion: UIImageView!
    
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    @IBAction func likeButtonTapped(_ sender: Any) {
        self.delegate?.likeButtonTapped(indexPath: indexPath)
    }
    
}
