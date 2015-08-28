//
//  Travel.swift
//  WorkAngel-Sorter
//
//  Created by Vincenzo Favara on 28/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import Foundation

class Travel: NSObject, NSCoding {
    
    var cityFrom : String
    var cityTo : String

    var typeTrasport : String
    var place : String
    
    init(myCityFrom:String, myCityTo : String, myTypeTrasport: String, myPlace:String){
        self.cityFrom = myCityFrom
        self.cityTo = myCityTo
        self.typeTrasport = myTypeTrasport
        self.place = myPlace
    }
    
    internal required init(coder aDecoder: NSCoder) {
        self.cityFrom = aDecoder.decodeObjectForKey("kcityFrom") as! String
        self.cityTo = aDecoder.decodeObjectForKey("kcityTo") as! String
        self.typeTrasport = aDecoder.decodeObjectForKey("ktypeTrasport") as! String
        self.place = aDecoder.decodeObjectForKey("kplace") as! String
    }
    
    func encodeWithCoder(encoder: NSCoder) {
        encoder.encodeObject(self.cityFrom, forKey: "kcityFrom")
        encoder.encodeObject(self.cityTo, forKey: "kcityTo")
        encoder.encodeObject(self.typeTrasport, forKey: "ktypeTrasport")
        encoder.encodeObject(self.place, forKey: "kplace")
    }
}