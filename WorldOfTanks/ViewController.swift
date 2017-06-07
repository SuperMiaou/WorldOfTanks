//
//  ViewController.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var ui_tableViewPlayer: UITableView!
    @IBOutlet weak var ui_textPlayer: UITextField!
    @IBOutlet weak var ui_labelAlert: UILabel!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    
    let NICKNAME_PLAYER_KEY = "NICKNAME_PLAYER"
    let ACCOUNT_ID_KEY = "ACCOUNT_ID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        view.backgroundColor = .orange
        self.view.addSubview(view)
        
        ui_textPlayer.delegate = self
        ui_textPlayer.returnKeyType = .next
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            self._btn_validSearch(self)
            return false
            
            // Do any additional setup after loading the view, typically from a nib.
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    
    @IBAction func _btn_validSearch(_ sender: Any) {
        searchPlayer()
        
    }
    
    func GoToTankVC()  {
        if let tankVC = storyboard?.instantiateViewController(withIdentifier: "TankVC") {
            self.show(tankVC, sender: nil)
        }
    }
    
    func searchPlayer () {
        let pseudo: String = ui_textPlayer.text!
        Alamofire.request("https://api.worldoftanks.eu/wot/account/list/?application_id=8a0dbb9d6c9d3dd47f9311e8d3f10968&search=\(pseudo)&type=exact").validate().responseJSON(completionHandler: { (response:DataResponse<Any>) in
            var _accountId:Int
            var _nickname = ""
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if (pseudo.characters.count < 3) {
                    self.ui_labelAlert.text = "Veuillez renseigner un joueur avec minimum 3 caractères"
                } else {
                    if let nickname = json["data"][0]["nickname"].string {
                        _nickname = nickname
                    } else {
                        _nickname = ""
                    }
                    if let accountId = json["data"][0]["account_id"].int {
                        _accountId = accountId
                        self.ui_labelAlert.text = String(_accountId)
                        
                    } else {
                        _accountId = 0
                    }
                    
                    if (json["meta"]["count"] == 0 ) {
                        self.ui_labelAlert.text = "LE JOUEUR N'EXISTE PAS"
                        
                    } else {
                        if (json["meta"]["count"] > 1) {
                            self.ui_tableViewPlayer.isHidden = false
                            
                            
                            self.ui_labelAlert.text = "TROP DE JOUEURS A AFFICHER"
                            
                        } else {
                            
                            let userSettings = UserDefaults.standard
                            userSettings.set(_nickname, forKey: self.NICKNAME_PLAYER_KEY)
                            userSettings.set(_accountId, forKey: self.ACCOUNT_ID_KEY)
                            userSettings.synchronize()
                            self.GoToTankVC()
                        }
                    }
                }

            case .failure(let error):
                print(error)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



