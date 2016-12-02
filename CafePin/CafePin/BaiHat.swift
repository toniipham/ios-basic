//
//  BaiHat.swift
//  CafePin
//
//  Created by Cam Loan on 12/1/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class BaiHat{
    var idBH: String
    var tenBH: String
    var nodeBH: String? = ""
 /*
    init() {
        idBH = ""
        tenBH = ""
    }
    init(idBH: String, tenBH: String) {
        self.idBH = idBH
        self.tenBH = tenBH
    }
    */
    init(obj: Any) {
        //print(obj)
        if let bh: Dictionary<String,Any> = obj as? Dictionary<String,Any>{
            //print(bh["name"] as! String)
            idBH = bh["id"] as! String
            tenBH = bh["name"] as! String
            nodeBH = bh["node"] as? String
        }else{
            idBH = ""
            tenBH = ""
            nodeBH = ""
        }
    }
}
