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
    private var _name : String
    private var _description : String
    private var _tier : Int
    private var _type : String
    private var _image : String
    private var _nation: String
    private var _battles: Int
    private var _wins: Int
    private var _price_credit: Int
    private var _tag: String
    private var _crew: [Any]
    
    required init?(map: Map) {
        _name = ""
        _description = ""
        _tier = 0
        _type = ""
        _image = ""
        _nation = ""
        _battles = 0
        _wins = 0
        _price_credit = 0
        _tag = ""
        _crew = [""]
    }
    
    func mapping(map: Map) {
        _name <- map["name"]
        _image <- map["images.big_icon"]
        _nation <- map["nation"]
        _description <- map["description"]
        _type <- map ["type"]
        _tier <- map ["tier"]
        _battles <- map ["statistics.battles"]
        _wins <- map ["statistics.wins"]
        _price_credit <- map ["price_credit"]
        _tag <- map ["tag"]
        _crew <- map ["crew"]
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
    
    var battles : Int {
        get {
            return _battles
        }set {
            _battles = newValue
        }
    }
    
    var wins : Int {
        get {
            return _wins
        }set {
            _wins = newValue
        }
    }
    
    var price_credit : Int {
        get {
            return _price_credit
        }set {
            _price_credit = newValue
        }
    }
    
    var tag : String {
        get {
            return _tag
        }set {
            _tag = newValue
        }
    }
    
    var crew : [Any] {
        get {
            return _crew
        }set {
            _crew = newValue
        }
    }
    
    init(name: String, description: String, type: String, tier: Int, image: String, nation: String, battles: Int, wins: Int, price_credit: Int, tag: String, crew: [Any]) {
        _name = name
        _description = description
        _type = type
        _tier = tier
        _image = image
        _nation = nation
        _battles = battles
        _wins = wins
        _price_credit = price_credit
        _tag = tag
        _crew = crew
    }
}
