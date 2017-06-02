//
//  DetailTankViewController.swift
//  WorldOfTanks
//
//  Created by Matthieu on 02/06/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import UIKit
import AlamofireImage


class DetailTankViewController: UIViewController {

    
    @IBOutlet weak var ui_labelNameTank: UILabel!
    @IBOutlet weak var ui_imageViewTank: UIImageView!
    @IBOutlet weak var ui_imageViewNationTank: UIImageView!
    @IBOutlet weak var ui_labelTypeTank: UILabel!
    @IBOutlet weak var ui_labelTierTank: UILabel!
    
    var _currentVehicle:Vehicles?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ui_labelNameTank.text = _currentVehicle!._name
        ui_imageViewTank?.af_setImage(withURL: URL(string: _currentVehicle!._image)!)
        ui_labelTierTank.text = String(_currentVehicle!._tier)
        ui_labelTypeTank.text = _currentVehicle!._type
        
        if (_currentVehicle!._nation == "france") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "fra")
        } else if (_currentVehicle!._nation == "usa") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "usa")
        } else if (_currentVehicle!._nation == "germany") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "all")
        } else if (_currentVehicle!._nation == "ussr") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "urss")
        } else if (_currentVehicle!._nation == "czech") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "czech")
        } else if (_currentVehicle!._nation == "sweden") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "sweden")
        } else if (_currentVehicle!._nation == "japan") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "jap")
        } else if (_currentVehicle!._nation == "uk") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "uk")
        } else if (_currentVehicle!._nation == "china") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "chine")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
