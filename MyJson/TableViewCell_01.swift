//
//  TableViewCell_01.swift
//  MyJson
//
//  Created by Cam Loan on 11/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class TableViewCell_01: UITableViewCell {

    // MARK: OUTLET of Khoa Hoc
    @IBOutlet weak var imgHinhKhoaHoc: UIImageView!
    @IBOutlet weak var lblKhoaHoc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imgHinhKhoaHoc.contentMode = .scaleAspectFill
        imgHinhKhoaHoc.clipsToBounds = true
        imgHinhKhoaHoc.layer.cornerRadius = imgHinhKhoaHoc.bounds.size.width/2
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
