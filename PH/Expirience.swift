//
//  Discover_Child2.swift
//  PH
//
//  Created by Mawe Tecnologias on 17/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class Expirience: UIViewController, IndicatorInfoProvider, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tv_Expirience: UITableView!
    
    var expFilter = Array<Model_Foru>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataForu.inicializandoArrelgoForu()
        expFilter = DataForu.model_foru
        
        tv_Expirience.delegate = self
        tv_Expirience.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Outfitters")
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetallesEvento3"{
            
            let controllerDestination = segue.destination as? DetailForu
            let indexPath = tv_Expirience.indexPath(for: (sender as? UITableViewCell)!)
            
            let foruDestination = expFilter [indexPath!.row]
            controllerDestination?.foru = foruDestination
            
            
            
        }
    }
    
}
