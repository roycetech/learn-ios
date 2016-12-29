//
//  FeedTableViewCell.swift
//  Instagram Clone Demo
//
//  Created by Royce on 28/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewPosted: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
