//
//  DetailForu.swift
//  PH
//
//  Created by Mawe Tecnologias on 23/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class  DetailForu: UIViewController {
    var foru : Model_Foru?
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var mapview: MKMapView!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let foru = self.foru{
            
            lblName.text = foru.name
            lblPlace.text = foru.place
            imgImage.image = UIImage(named: foru.img!)
            
            self.title = foru.name
            
        }
        
    }
    
    
    
    
}
