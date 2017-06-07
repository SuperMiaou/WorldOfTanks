//
//  DataManager.swift
//  WorldOfTanks
//
//  Created by Matthieu on 01/06/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {
    private static var s_instance:DataManager?
    static func getInstance() -> DataManager {
        if s_instance == nil {
            s_instance = DataManager()
        }
        
        return s_instance!
    }
    
    private init() {
        
    }
    
    let _cacheManager = CacheManager()
    
    private func loadData(forUrl url:String, onSuccess:@escaping (JSON)->Void)  {
        if let cachedData = _cacheManager.getData(forUrl: url),
            let dataFromString = cachedData.data(using: .utf8, allowLossyConversion: false) {
            onSuccess(JSON(data: dataFromString))
        } else {
            downloadData(forUrl: url, onSuccess: onSuccess)
        }
    }
    
    private func downloadData(forUrl url:String, onSuccess:@escaping (JSON)->Void) {
        Alamofire.request(url).validate().responseString { (response:DataResponse<String>) in
            if let downloadedData = response.result.value,
            let dataFromString = downloadedData.data(using: .utf8, allowLossyConversion: false){
                onSuccess(JSON(data: dataFromString))
                self._cacheManager.setData(downloadedData, forUrl: url)
            }
        }
    }
    
    func loadTankData(forTankId tankId:Int, onSuccess:@escaping (Vehicles)->Void) {
        //print("loadTankData \(tankId)")
        loadData(forUrl: "https://api.worldoftanks.eu/wot/encyclopedia/vehicles/?application_id=8a0dbb9d6c9d3dd47f9311e8d3f10968&tank_id=\(tankId)&language=fr") { (jsonData:JSON) in
            if let tankStringData = jsonData["data"]["\(tankId)"].rawString(),
                let vehicle = Vehicles(JSONString: tankStringData) {
                onSuccess(vehicle)
            }
        }
    }
    
    
    func loadTankListData(forAccount account_id:Int, onTankListUpdated:@escaping ([Vehicles])->Void) {
        //print("loadTankListData")
        loadData(forUrl: "https://api.worldoftanks.eu/wot/account/tanks/?application_id=8a0dbb9d6c9d3dd47f9311e8d3f10968&account_id=\(account_id)") { (jsonData:JSON) in
            debugPrint(jsonData)
            var tankList:[Vehicles] = []
            let tankJsonList = jsonData["data"]["\(account_id)"]
            var interval:TimeInterval = 0
            for (_,tankData):(String, JSON) in tankJsonList {
                if let tankId = tankData["tank_id"].int {
                    interval += 0.1
                    Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
                        self.loadTankData(forTankId: tankId, onSuccess: { (tank:Vehicles) in
                            tankList.append(tank)
                            onTankListUpdated(tankList)
                        })
                    })
                    
                }
            }
//            if let tankList = Array<Vehicles>(JSONString: jsonString) {
//                onSuccess(tankList)
//            }
        }
    }
    
    func loadPlayerData(forPlayerName nickname:String, onSuccess:@escaping (Player)->Void) {
        print("loadPlayerData \(nickname)")
        loadData(forUrl: "https://api.worldoftanks.eu/wot/account/list/?application_id=8a0dbb9d6c9d3dd47f9311e8d3f10968&search=\(nickname)&type=exact") { (jsonData:JSON) in
            if let playerStringData = jsonData["data"][0]["\(nickname)"].rawString(),
                let nickname = Player(JSONString: playerStringData) {
                onSuccess(nickname)
            }
        }
    }
}
