//
//  ViewController.swift
//  WorldOfTanks
//
//  Created by Matthieu on 30/05/2017.
//  Copyright © 2017 Matthieu. All rights reserved.
//

import UIKit
import Alamofire

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
        Alamofire.request("https://api.worldoftanks.eu/wot/account/list/?application_id=demo&search=\(pseudo)").responseJSON(completionHandler: { (response:DataResponse<Any>) in
            var todoAsAccount = ""
            var todoAsPseudo = ""
            debugPrint(response)
                if let jsonArray = response.result.value as? [String:Any],
                    let data = jsonArray["data"] as? [Any],
                    let firstObject = data.first as? [String:Any] {
                    
                    if (data.count > 1) {
                        self.ui_labelAccount.text = "TROP DE JOUEURS A AFFICHER"

                    } else {
                        todoAsAccount += "\(firstObject["account_id"] as! Int)"
                        todoAsPseudo += "\(firstObject["nickname"] as! Int)"
                        
                        let userSettings = UserDefaults.standard
                        userSettings.set(todoAsPseudo, forKey: self.NICKNAME_PLAYER_KEY)
                        userSettings.set(todoAsAccount, forKey: self.ACCOUNT_ID_KEY)
                        userSettings.synchronize()
                                            
                    }
                    //                for todoData:Any in jsonArray {
                    //                    if let todoItem:[String:Any] = todoData as? [String:Any] {
                    //                        print(todoItem)
                    //                        todoAsString += "Numéro de compte : \(todoItem["account_id"] as! String) \n"
                    //                    }
                    //                }
                } else {
                    self.ui_labelAccount.text = "joueur introuvable"

            }
                //self.ui_labelAccount.text = todoAsAccount
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

