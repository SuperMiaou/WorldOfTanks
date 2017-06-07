//
//  Player.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Player : Mappable {
    var _account_id : Int
    var _data: [Data]
    
    required init?(map: Map) {
        _account_id = 0
        _data = []

    }
    
    func mapping(map: Map) {
        _account_id <- map["account_id"]
        _data <- map["\(account_id)"]
    }
    
    var account_id : Int {
        get {
            return _account_id
        } set {
            _account_id = newValue
        }
    }
    
    var data : [Data] {
        get {
            return _data
        } set {
            _data = newValue
        }
    }
    
    init(account_id: Int, data: [Data]) {
        _account_id = account_id
        _data = data
    }
}
