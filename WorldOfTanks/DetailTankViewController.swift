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

    @IBOutlet weak var ui_textViewDescription: UITextView!
    @IBOutlet weak var ui_labelNameTank: UILabel!
    @IBOutlet weak var ui_imageViewTank: UIImageView!
    @IBOutlet weak var ui_imageViewNationTank: UIImageView!
    @IBOutlet weak var ui_labelTypeTank: UILabel!
    @IBOutlet weak var ui_labelTierTank: UILabel!
    @IBOutlet weak var ui_imageViewTypeTank: UIImageView!
    
    var _currentVehicle:Vehicles?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ui_labelNameTank.text = _currentVehicle!._name
        ui_imageViewTank?.af_setImage(withURL: URL(string: _currentVehicle!._image)!)
        ui_labelTierTank.text = String(_currentVehicle!._tier)
        ui_textViewDescription.text = _currentVehicle!._description
        
        if (_currentVehicle!._tier == 1) {
            ui_labelTierTank.text = "I"
        } else if (_currentVehicle!._tier == 2) {
            ui_labelTierTank.text = "II"
        } else if (_currentVehicle!._tier == 3) {
            ui_labelTierTank.text = "III"
        } else if (_currentVehicle!._tier == 4) {
            ui_labelTierTank.text = "IV"
        } else if (_currentVehicle!._tier == 5) {
            ui_labelTierTank.text = "V"
        } else if (_currentVehicle!._tier == 6) {
            ui_labelTierTank.text = "VI"
        } else if (_currentVehicle!._tier == 7) {
            ui_labelTierTank.text = "VII"
        } else if (_currentVehicle!._tier == 8) {
            ui_labelTierTank.text = "VIII"
        } else if (_currentVehicle!._tier == 9) {
            ui_labelTierTank.text = "IX"
        } else if (_currentVehicle!._tier == 10) {
            ui_labelTierTank.text = "X"
        }
        
        if (_currentVehicle!._type == "lightTank") {
            ui_labelTypeTank.text = "Char Leger"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "light")
        } else if (_currentVehicle!._type == "mediumTank") {
            ui_labelTypeTank.text = "Char Moyen"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "medium")
        } else if (_currentVehicle!._type == "heavyTank") {
            ui_labelTypeTank.text = "Char Lourd"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "heavy")
        } else if (_currentVehicle!._type == "SPG") {
            ui_labelTypeTank.text = "Canon Automoteur"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "arty")
        } else if (_currentVehicle!._type == "AT-SPG") {
            ui_labelTypeTank.text = "Chasseur de chars"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "td")
        }
        
        
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
