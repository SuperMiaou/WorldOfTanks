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
    var _account_id : Int
    var _tank_id : Int
    
    var pseudo : String {
        get {
            return _pseudo
        } set {
            _pseudo = newValue
        }
    }
    
    var account_id : Int {
        get {
            return _account_id
        } set {
            _account_id = newValue
        }
    }
    
    var tank_id : Int {
        get {
            return _tank_id
        }set {
            _tank_id = newValue
        }
    }
    
//    var tank_id : [Int] {
//        get {
//            if let tid = _tank_id {
//                return tid
//            }
//        } set {
//            _tank_id = newValue
//        }
//    }
    
    init(pseudo: String, account_id: Int, tank_id: Int) {
        _pseudo = pseudo
        _account_id = account_id
        _tank_id = tank_id
    }
    
    
}
