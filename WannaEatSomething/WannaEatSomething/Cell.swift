//
//  Cell.swift
//  WannaEatSomething
//
//  Created by Iza on 26.04.2017.
//  Copyright © 2017 IB. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var background: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
