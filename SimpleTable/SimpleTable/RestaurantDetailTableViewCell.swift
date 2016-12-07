//
//  RestaurantDetailTableViewCell.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/30/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lblField: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
