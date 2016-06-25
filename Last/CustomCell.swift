//
//  CustomCell.swift
//  Last
//
//  Created by Anokhi Patel on 21/06/16.
//  Copyright © 2016 Anokhi Patel. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
