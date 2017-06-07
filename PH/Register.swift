//
//  Register.swift
//  PH
//
//  Created by Mawe Tecnologias on 02/03/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Register:UIViewController{
    
    let URL_USER_REGISTER = "http://13.85.74.253:8000/api/register"
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCPassword: UITextField!
    @IBAction func btn_Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func btnRegister(_ sender: UIButton) {
        let  parameters: Parameters=[
        
            "name":txtName.text!,
            "email":txtEmail.text!,
            "password":txtPassword.text!
        ]
        
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                
                print(response)
                
                if let result = response.result.value {
                    
                    
                    let jsonData = result as! NSDictionary
                    
                    print("Registrado En base de datos")
                    
                    //displaying the message in label
                    //self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
    }
    
    
    
    
    
}
