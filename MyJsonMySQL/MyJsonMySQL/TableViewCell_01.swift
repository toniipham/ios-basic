//
//  TableViewCell_01.swift
//  MyJsonMySQL
//
//  Created by Cam Loan on 11/26/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class TableViewCell_01: UITableViewCell {

    //MARK: OUTLET
    
    @IBOutlet weak var lblTenBH: UILabel!
    @IBOutlet weak var imgPhotoBH: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imgPhotoBH.contentMode = .scaleAspectFill
        imgPhotoBH.clipsToBounds = true
        imgPhotoBH.layer.cornerRadius = imgPhotoBH.bounds.size.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
