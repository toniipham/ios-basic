//
//  RestaurantTableViewCell_01.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/30/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class RestaurantTableViewCell_01: UITableViewCell {

    @IBOutlet weak var imgRestaurant: UIImageView!
    @IBOutlet weak var lblResName: UILabel!
    @IBOutlet weak var lblResLocation: UILabel!
    @IBOutlet weak var lblResType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
