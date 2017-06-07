//
//  Data.swift
//  WorldOfTanks
//
//  Created by Matthieu on 07/06/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class TankStatistics : Mappable {
    var _tank_id: Int
    var _battles: Int
    var _wins: Int
    
    required init?(map: Map) {
        _tank_id = 0
        _battles = 0
        _wins = 0
        
    }
    
    func mapping(map: Map) {
        _tank_id <- map["tank_id"]
        _battles <- map ["statistics.battles"]
        _wins <- map ["statistics.wins"]
    }
    
    var tank_id : Int {
        get {
            return _tank_id
        }set {
            _tank_id = newValue
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
    
    init(tank_id: Int = 0, battles: Int = 0, wins: Int = 0) {
        _tank_id = tank_id
        _battles = battles
        _wins = wins
    }
}
