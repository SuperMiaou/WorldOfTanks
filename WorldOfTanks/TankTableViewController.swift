//
//  TankTableViewController.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import UIKit
import SystemConfiguration
import Alamofire
import SwiftyJSON
import AlamofireImage

class TankTableViewCell: UITableViewCell {
    @IBOutlet weak var ui_imageViewTank: UIImageView!
    @IBOutlet weak var ui_labelNameTank: UILabel!
    @IBOutlet weak var ui_imageViewNationTank: UIImageView!
    @IBOutlet weak var ui_labelNilTank: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        ui_imageViewTank.af_cancelImageRequest()
        //        ui_imageViewTank.image = nil
        //        ui_labelNameTank.text = ""
        //        ui_imageViewNationTank.image = nil
        
    }
}

class TankTableViewController: UITableViewController {
    
    @IBOutlet var ui_tableView: UITableView!
    let NICKNAME_PLAYER_KEY = "NICKNAME_PLAYER"
    let ACCOUNT_ID_KEY = "ACCOUNT_ID"
    var _tankId:Int = 0
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredTanks:[Vehicles] = []
    
    
    var _nameTank: String = ""
    var _imageTank: String = ""
    var _typeTank: String = ""
    var _descriptionTank: String = ""
    var _nationTank: String = ""
    var _tierTank: Int = 0
    
    var _tankList:[Vehicles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let button = UIButton.init(type: .custom)
//        button.setImage(UIImage.init(named: "icon_button_back2.png"), for: UIControlState.normal)
//        button.addTarget(self, action: #selector(TankTableViewController.backView), for: UIControlEvents.touchUpInside)
//        button.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35) //CGRectMake(0, 0, 30, 30)
//        let barButton = UIBarButtonItem.init(customView: button)
//        self.navigationItem.leftBarButtonItem = barButton
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        
        // Setup the Scope Bar
        
        searchController.searchBar.scopeButtonTitles = ["All", "lightTank", "mediumTank", "heavyTank", "AT-SPG", "SPG"]
        tableView.tableHeaderView = searchController.searchBar
        
        ui_tableView.dataSource = self
        
        searchTanks()
        
    }
    
//    func backView() {
//        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier:"ViewController") as! ViewController
//        self.navigationController?.pushViewController(secondViewController, animated: true)
//        //self.navigationController?.popToViewController(self.navigationController!.viewControllers as! ViewController, animated: true)
//    }
    
    func searchTanks () {
        let userSettings = UserDefaults.standard
        
        let account_id: Int = userSettings.integer(forKey: "ACCOUNT_ID")
        DataManager.getInstance().loadTankListData(forAccount: account_id ) { (tankList:[Vehicles]) in
            self._tankList = tankList
            self.tableView.reloadData()
            
        }
    }
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTanks.count
        } else {
            if _tankList.count == 0 {
                return 1
            }
            return _tankList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tankIdentifier", for: indexPath) as! TankTableViewCell
        let tank: Vehicles
        
        if _tankList.count != 0 {
            if searchController.isActive && searchController.searchBar.text != "" {
                tank = filteredTanks[indexPath.row]
                
            } else {
                tank = self._tankList[indexPath.row]
            }
            var interval:TimeInterval = 0
            interval += 1.0
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
                
                //cell.textLabel?.text = "\(tank.name)"
                //cell.imageView?.af_setImage(withURL: URL(string: tank.image)!)
                //cell.detailTextLabel?.text = "\(tank.nation)"
                
                cell.ui_labelNameTank.isHidden = false
                cell.ui_imageViewTank.isHidden = false
                cell.ui_imageViewNationTank.isHidden = false
                cell.isUserInteractionEnabled = true
                cell.ui_labelNilTank.isHidden = true
                
                cell.ui_labelNameTank.text = "\(tank.name)"
                cell.ui_imageViewTank?.af_setImage(withURL: URL(string: tank.image)!)
                
                if (tank.nation == "france") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "fra")
                } else if (tank.nation == "usa") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "usa")
                } else if (tank.nation == "germany") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "all")
                } else if (tank.nation == "ussr") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "urss")
                } else if (tank.nation == "czech") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "czech")
                } else if (tank.nation == "sweden") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "sweden")
                } else if (tank.nation == "japan") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "jap")
                } else if (tank.nation == "uk") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "uk")
                } else if (tank.nation == "china") {
                    cell.ui_imageViewNationTank.image = #imageLiteral(resourceName: "chine")
                }
            })
        } else {
            var interval:TimeInterval = 0
            interval += 2.0
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
                cell.ui_labelNilTank.text = "Le joueur ne possède pas de tank"
            })
        }
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "Tous") {
        filteredTanks = _tankList.filter({( tank : Vehicles) -> Bool in
            let categoryMatch = (scope == "All") || (tank.type == scope)
            return categoryMatch && tank.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" ,
            let nextScene = segue.destination as? DetailTankViewController ,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let tank: Vehicles
            if searchController.isActive && searchController.searchBar.text != "" {
                tank = filteredTanks[indexPath.row]
            } else {
                tank = _tankList[indexPath.row]
            }
            let selectedVehicle = tank
            nextScene._currentVehicle = selectedVehicle
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        //let playmusic = ViewController()
        //playmusic.backgroundMusicPlayer.play()
    }
}

extension TankTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension TankTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
