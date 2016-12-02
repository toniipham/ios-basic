//
//  ExtensionFunction.swift
//  CafePin
//
//  Created by Cam Loan on 12/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
class ExtensionFunction{
    
    func generateID() -> String{
        var str = ""
        str = "\(getDate())_\(getTime())"
        return str
    }
    
    func getTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nano = calendar.component(.nanosecond, from: date)
        return "\(hour)-\(minutes)-\(second)-\(nano)"
    }
    func getDate()->String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(day)/\(month)/\(year)"
        //return "\(day)/\(month)/\(year) \(hour):\(minutes)"
    }
}
