//
//  TableViewCell.swift
//  CodeToArtMobisysMachineTest
//
//  Created by harshad kekane on 30/08/17.
//  Copyright © 2017 harshad kekane. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imageViewCell: UIImageView!
    
    @IBOutlet var dateLblCell: UILabel!
    
    @IBOutlet var nameLabelCell: UITextView!
    
    @IBOutlet var categoryLblCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
