//
//  Favorite.swift
//  PH
//
//  Created by Mawe Tecnologias on 01/03/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit

class Favorite:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    var expFilter = Array<Model_Foru>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Raleway-Light", size: 17)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        DataForu.inicializandoArrelgoForu()
        expFilter = DataForu.model_foru
       
       
    }
    
    
    @IBOutlet weak var tv_Expirience: UITableView!

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expFilter.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tv_Expirience.dequeueReusableCell(withIdentifier: "Exp_cell", for: indexPath) as? ExpCell
        
        cell?.lbl_myTitle.text = expFilter[indexPath.row].name
        cell?.lbl_myPlace.text = expFilter[indexPath.row].place
        cell?.lbl_myReview.text =  expFilter [indexPath.row].review
        //cell?.img_myImage.image = expFilter[indexPath.row].img
        
        if let imagen = expFilter[indexPath.row].img{
            cell?.img_myImage.image = UIImage(named : imagen)}
        
        return cell!
    }
    
    
    
    
}
