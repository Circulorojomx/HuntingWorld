//
//  Model_Foru.swift
//  PH
//
//  Created by Mawe Tecnologias on 23/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation

class Model_Foru{

    var name : String?
    var place : String?
    var review : String?
    
    var img: String?
    
    
    init() {
        name = ""
        place = ""
        review = ""
    }

    init(img : String, name : String, place : String , review : String ) {
        self.img = img
        self.name = name
        self.place = place
        self.review = review
    }


}
