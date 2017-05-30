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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func _btn_validSearch(_ sender: Any) {
        searchPlayer()
    }
    
    // Test de partage
    // a mon tour !d;gjhqkergnqkgqgqrg
    
    func searchPlayer () {
        let pseudo: String = ui_textPlayer.text!
        Alamofire.request("https://api.worldoftanks.eu/wot/account/list/?application_id=demo&search=\(pseudo)").responseJSON(completionHandler: { (response:DataResponse<Any>) in
            var todoAsAccount = ""
            var todoAsPseudo = ""
            debugPrint(response)
                if let jsonArray = response.result.value as? [String:Any],
                let data = jsonArray["data"] as? [Any],
                    let firstObject = data.first as? [String:Any] {
                    
                    todoAsAccount += "\(firstObject["account_id"] as! Int)"
                    todoAsPseudo += "\(firstObject["nickname"] as! Int)"
                    
                    //                for todoData:Any in jsonArray {
                    //                    if let todoItem:[String:Any] = todoData as? [String:Any] {
                    //                        print(todoItem)
                    //                        todoAsString += "Numéro de compte : \(todoItem["account_id"] as! String) \n"
                    //                    }
                    //                }
                }
                self.ui_labelAccount.text = todoAsAccount
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

