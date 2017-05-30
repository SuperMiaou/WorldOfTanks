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
    var _tier : String
    var _picture : UIImage
    var _nation: String
    
    
    var name : String {
        get {
            return _name
        }
    }
    var description : String {
        get {
            return _description
        }
    }
    
    var tier : String {
        get {
            return _tier
        }
    }
    
    var image : UIImage {
        get {
            return _picture
        }
    }
    
    var nation : String {
        get {
            return _nation
        }
    }
    
    init(name: String, description: String, tier: String, picture: UIImage, nation: String) {
        _name = name
        _description = description
        _tier = tier
        _picture = picture
        _nation = nation
    }
}
