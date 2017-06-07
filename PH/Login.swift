//
//  Login.swift
//  PH
//
//  Created by Mawe Tecnologias on 16/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

class Login:UIViewController{

    let URL_USER_LOGIN = "http://13.85.74.253:8000/oauth/token"
    
    

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btmLogin(_ sender: UIButton) {
        var defaults = UserDefaults.standard
        defaults.set(token, "user_token")
        defaults.string(forKey: "user_token")
        /*let parameters = [
            "grant_type" : "",
            "client_id" : "",
            "client_secret" : "",
            "username": txtEmail.text!, //email
            "password": txtPassword.text!, //password
            "scope" : ""
        ]
        
        var statusCode: Int = 0
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                statusCode = (response.response?.statusCode)!
                
                if let value: AnyObject = response.result.value as AnyObject? {
                    
                    let post = JSON(value)
                    
                    if let key = post["session_id"].string {
                        
                    } else {
                        print("error detected")
                    }
                }
        }*/
        performSegue(withIdentifier: "goToMain", sender: self)
    }





}
