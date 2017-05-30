//
//  Player.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import UIKit

class Player {
    
    var _pseudo : String
    var _tank_id : Int
    
    var pseudo : String {
        get {
            return _pseudo
        }
    }
    
    var tank_id : Int {
        get {
            return _tank_id
        }
    }
    
    init(pseudo: String, tank_id: Int) {
        _pseudo = pseudo
        _tank_id = tank_id
    }
    
    
}
