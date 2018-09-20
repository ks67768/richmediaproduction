//
//  MyTableViewCell.swift
//  Final - KarolinaSabonaityte
//
//  Created by Karolina Sabonaityte on 11/9/17.
//  Copyright © 2017 Karolina Sabonaityte. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var whichMin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
