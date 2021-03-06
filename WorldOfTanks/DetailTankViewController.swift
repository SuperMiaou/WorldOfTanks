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
    @IBOutlet weak var ui_labelPourcentage: UILabel!
    @IBOutlet weak var ui_labelNbBataille: UILabel!
    @IBOutlet weak var ui_label_price_credit: UILabel!
    @IBOutlet weak var ui_imageViewPrice: UIImageView!
    
    
    var _currentVehicle:Vehicles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Détail du char"
        ui_labelNameTank.text = _currentVehicle!.name
        ui_imageViewTank?.af_setImage(withURL: URL(string: _currentVehicle!.image)!)
        ui_labelTierTank.text = String(_currentVehicle!.tier)
        ui_textViewDescription.text = _currentVehicle!.description
        
        if (_currentVehicle?.price_credit == 0 && _currentVehicle?.tier != 1) {
            ui_imageViewPrice.image = #imageLiteral(resourceName: "premium")
            ui_label_price_credit.textColor = UIColor.orange
            ui_label_price_credit.text = "Char Premium"
        } else {
            ui_imageViewPrice.image = #imageLiteral(resourceName: "credits")
            ui_label_price_credit.text = String(_currentVehicle!.price_credit)
        }
        
        if let nbBtaille = _currentVehicle?.battles {
            ui_labelNbBataille.text = "Bataille(s) : \(nbBtaille)"
        }
        
        let pourcentage = String((_currentVehicle?.wins)! * 100 / (_currentVehicle?.battles)!)
        ui_labelPourcentage.text = "Victoire : \(pourcentage) %"
        
        if (_currentVehicle!.tier == 1) {
            ui_labelTierTank.text = "I Rang"
        } else if (_currentVehicle!.tier == 2) {
            ui_labelTierTank.text = "II Rang"
        } else if (_currentVehicle!.tier == 3) {
            ui_labelTierTank.text = "III Rang"
        } else if (_currentVehicle!.tier == 4) {
            ui_labelTierTank.text = "IV Rang"
        } else if (_currentVehicle!.tier == 5) {
            ui_labelTierTank.text = "V Rang"
        } else if (_currentVehicle!.tier == 6) {
            ui_labelTierTank.text = "VI Rang"
        } else if (_currentVehicle!.tier == 7) {
            ui_labelTierTank.text = "VII Rang"
        } else if (_currentVehicle!.tier == 8) {
            ui_labelTierTank.text = "VIII Rang"
        } else if (_currentVehicle!.tier == 9) {
            ui_labelTierTank.text = "IX Rang"
        } else if (_currentVehicle!.tier == 10) {
            ui_labelTierTank.text = "X Rang"
        }
        
        if (_currentVehicle!.type == "lightTank") {
            ui_labelTypeTank.text = "Char Leger"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "light")
        } else if (_currentVehicle!.type == "mediumTank") {
            ui_labelTypeTank.text = "Char Moyen"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "medium")
        } else if (_currentVehicle!.type == "heavyTank") {
            ui_labelTypeTank.text = "Char Lourd"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "heavy")
        } else if (_currentVehicle!.type == "SPG") {
            ui_labelTypeTank.text = "Canon Automoteur"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "arty")
        } else if (_currentVehicle!.type == "AT-SPG") {
            ui_labelTypeTank.text = "Chasseur de chars"; ui_imageViewTypeTank.image = #imageLiteral(resourceName: "td")
        }
        
        
        if (_currentVehicle!.nation == "france") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "fra")
        } else if (_currentVehicle!.nation == "usa") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "usa")
        } else if (_currentVehicle!.nation == "germany") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "all")
        } else if (_currentVehicle!.nation == "ussr") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "urss")
        } else if (_currentVehicle!.nation == "czech") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "czech")
        } else if (_currentVehicle!.nation == "sweden") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "sweden")
        } else if (_currentVehicle!.nation == "japan") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "jap")
        } else if (_currentVehicle!.nation == "uk") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "uk")
        } else if (_currentVehicle!.nation == "china") {
            ui_imageViewNationTank.image = #imageLiteral(resourceName: "chine")
        }
        
        if let crew = _currentVehicle?.crew {
            for i in 0..<crew.count {
                print("nombre", crew[i])
            }
        }
        
        // Do any additional setup after loading the view.
        
    }
    @IBAction func openWebSite(_ sender: Any) {
        if let tank = _currentVehicle {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: "https://worldoftanks.eu/fr/tankopedia/\(tank.tag)")! as URL)
            } else {
                UIApplication.shared.openURL(URL(string: "https://worldoftanks.eu/fr/tankopedia/\(tank.tag)")! as URL)

            }
        }
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
