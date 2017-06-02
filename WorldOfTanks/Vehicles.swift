//
//  Vehicles.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


class Vehicles : Mappable {
    var _name : String
    var _description : String
    var _tier : Int
    var _type : String
    var _image : String
    var _nation: String
    
    required init?(map: Map) {
        _name = ""
        _description = ""
        _tier = 0
        _type = ""
        _image = ""
        _nation = ""
    }
    
    func mapping(map: Map) {
        _name <- map["name"]
        _image <- map["images.big_icon"]
        _nation <- map["nation"]
        _description <- map["description"]
        _type <- map ["type"]
        _tier <- map ["tier"]
    }
    
    
    var name : String {
        get {
            return _name
        }set {
            _name = newValue
        }
    }
    
    var description : String {
        get {
            return _description
        }set {
            _description = newValue
        }
    }
    
    var type : String {
        get {
            return _type
        }set {
            _type = newValue
        }
    }
    
    var tier : Int {
        get {
            return _tier
        }set {
            _tier = newValue
        }
    }
    
    var image : String {
        get {
            return _image
        }set {
            _image = newValue
        }
    }
    
    var nation : String {
        get {
            return _nation
        }set {
            _nation = newValue
        }
    }
    
    init(name: String, description: String, type: String, tier: Int, image: String, nation: String) {
        _name = name
        _description = description
        _type = type
        _tier = tier
        _image = image
        _nation = nation
    }
}
