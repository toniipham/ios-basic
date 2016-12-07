//
//  RestaurantTableViewCell.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var lblResName: UILabel!
    @IBOutlet weak var lblResLocation: UILabel!
    @IBOutlet weak var lblResType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgThumbnail.clipsToBounds = true
        imgThumbnail.layer.cornerRadius = imgThumbnail.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
