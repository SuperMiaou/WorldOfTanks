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


class ViewController: UIViewController {

    
    @IBOutlet weak var ui_textPlayer: UITextField!
    @IBOutlet weak var ui_labelAccount: UILabel!
    
    let NICKNAME_PLAYER_KEY = "NICKNAME_PLAYER"
    let ACCOUNT_ID_KEY = "ACCOUNT_ID"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        view.backgroundColor = .orange
        self.view.addSubview(view)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func _btn_validSearch(_ sender: Any) {
        searchPlayer()
    }
    
    func searchPlayer () {
        let pseudo: String = ui_textPlayer.text!
        Alamofire.request("https://api.worldoftanks.eu/wot/account/list/?application_id=demo&search=\(pseudo)").validate().responseJSON(completionHandler: { (response:DataResponse<Any>) in
            var _accountId:Int
            var _nickname = ""
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let nickname = json["data"][0]["nickname"].string {
                   _nickname = nickname
                } else {
                    _nickname = ""
                }
                if let accountId = json["data"][0]["account_id"].int {
                  _accountId = accountId
                    self.ui_labelAccount.text = String(_accountId)
                    
                } else {
                    _accountId = 0
                }
            
                if (json["meta"]["count"] > 1) {
                    self.ui_labelAccount.text = "TROP DE JOUEURS A AFFICHER"
                    
                } else {
                    
                    let userSettings = UserDefaults.standard
                    userSettings.set(_nickname, forKey: self.NICKNAME_PLAYER_KEY)
                    userSettings.set(_accountId, forKey: self.ACCOUNT_ID_KEY)
                    userSettings.synchronize()
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

