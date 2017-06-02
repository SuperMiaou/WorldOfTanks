//
//  TankTableViewController.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class TankTableViewController: UITableViewController {

    @IBOutlet var ui_tableView: UITableView!
    
    
    let NICKNAME_PLAYER_KEY = "NICKNAME_PLAYER"
    let ACCOUNT_ID_KEY = "ACCOUNT_ID"
    var _tankId:Int = 0
    
    var _nameTank: String = ""
    var _imageTank: String = ""
    var _typeTank: String = ""
    var _descriptionTank: String = ""
    var _nationTank: String = ""
    var _tierTank: Int = 0
    
    var _tankList:[Vehicles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ui_tableView.dataSource = self

        searchTanks()

    }

    
    func searchTanks () {
        let userSettings = UserDefaults.standard
            
        let account_id: Int = userSettings.integer(forKey: "ACCOUNT_ID")
        DataManager.getInstance().loadTankListData(forAccount: account_id ) { (tankList:[Vehicles]) in
            self._tankList = tankList
            self.tableView.reloadData()
            
//            let json = JSON(value)
//            if let tankId = json["data"][String(account_id)][0]["tank_id"].int {
//                self._tankId = tankId
//            } else {
//                self._tankId = 0
//            }
//            self.detailsTank()
        }
        
//        Alamofire.request("https://api.worldoftanks.eu/wot/account/tanks/?application_id=demo&account_id=\(account_id)").validate().responseJSON(completionHandler: { (response:DataResponse<Any>) in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                if let tankId = json["data"][String(account_id)][0]["tank_id"].int {
//                    self._tankId = tankId
//                } else {
//                    self._tankId = 0
//                }
//            case .failure(let error):
//                print(error)
//            }
//        })
    }
    
    //  EXECUTER LA DEUXIEME FONCTION ASYNCHRONE
    
//    func detailsTank () {
//        Alamofire.request("https://api.worldoftanks.eu/wot/encyclopedia/vehicles/?application_id=demo&tank_id=\(self._tankId)&language=fr").validate().responseJSON(completionHandler: { (response:DataResponse<Any>) in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                if let nameTank = json["data"][String(self._tankId)]["name"].string {
//                    self._nameTank = nameTank
//                } else {
//                    self._nameTank = ""
//                }
//                if let imageTank = json["data"][String(self._tankId)]["images"]["small_icon"].string {
//
//                    self._imageTank = imageTank
//                } else {
//                    self._imageTank = ""
//                }
//                if let typeTank = json["data"][String(self._tankId)]["type"].string {
//                    self._typeTank = typeTank
//                } else {
//                    self._typeTank = ""
//                }
//                if let descriptionTank = json["data"][String(self._tankId)]["description"].string {
//                    self._descriptionTank = descriptionTank
//                } else {
//                    self._descriptionTank = ""
//                }
//                if let nationTank = json["data"][String(self._tankId)]["nation"].string {
//                    self._nationTank = nationTank
//                } else {
//                    self._nationTank = ""
//                }
//                if let tierTank = json["data"][String(self._tankId)]["tier"].int {
//                    self._tierTank = tierTank
//                } else {
//                    self._tierTank = 0
//                }
//                self.ui_tableView.reloadData()
//
//            case .failure(let error):
//                print(error)
//            }
//        })
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _tankList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tankIdentifier")!

        let tank = _tankList[indexPath.row]
        cell.textLabel?.text = "\(tank.name)"
        cell.imageView?.af_setImage(withURL: URL(string: tank.image)!)
        cell.detailTextLabel?.text = "\(tank.nation)"
        

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
