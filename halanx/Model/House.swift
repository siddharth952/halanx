//
//  House.swift
//  halanx
//
//  Created by Siddharth Sen on 24/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

class House{
    
    var title: String?
    var rent: String?
    var street_address: String?
    var imageurl: String?
    
    init(title:String?,rent:String?,street_address:String?,imageurl:String?) {
        self.title = title
        self.rent = rent
        self.street_address = street_address
        self.imageurl = imageurl
    }
}
