//
//  Restaurant.swift
//  SimpleTable
//
//  Created by Cam Loan on 11/30/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import Foundation

class Restaurant{
    var name = ""
    var location = ""
    var type = ""
    var phone = ""
    var image = ""
    var isVisited = false
    var rating = ""
    
//    init(RestaurantName name:String, RestaurantLocation location:String, RestaurantType type:String, RestaurantPhoto photo:String,Visited isVisited:Bool) {
//        self.name = name
//        self.location = location
//        self.type = type
//        self.photo = photo
//        self.isVisited = isVisited
//    }
    
    init(name:String, type:String, location:String, phone:String,  image:String, isVisited:Bool, rating: String) {
        self.name = name
        self.location = location
        self.type = type
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
        self.rating = rating
    }
}
