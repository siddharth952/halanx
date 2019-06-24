//
//  HouseTableViewCell.swift
//  halanx
//
//  Created by Siddharth Sen on 24/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {

    
    @IBOutlet weak var houseImg: UIImageView!
    
    @IBOutlet weak var houseTitle: UILabel!
    
    @IBOutlet weak var houseRent: UILabel!
    
    @IBOutlet weak var houseAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
