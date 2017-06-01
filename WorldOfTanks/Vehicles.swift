//
//  Vehicles.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import UIKit


class Vehicles {
    
    var _name : String
    var _description : String
    var _tier : Int
    var _type : String
    var _picture : String
    var _nation: String
    
    
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
            return _picture
        }set {
            _picture = newValue
        }
    }
    
    var nation : String {
        get {
            return _nation
        }set {
            _nation = newValue
        }
    }
    
    init(name: String, description: String, type: String, tier: Int, picture: String, nation: String) {
        _name = name
        _description = description
        _type = type
        _tier = tier
        _picture = picture
        _nation = nation
    }
}
