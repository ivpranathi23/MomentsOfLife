//
//  ViewDetailsTableViewCell.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class ViewDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var contentdescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
