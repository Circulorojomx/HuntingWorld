//
//  Favorite.swift
//  PH
//
//  Created by Mawe Tecnologias on 01/03/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class Places: UIViewController, IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var Cv_Plc: UICollectionView!
    @IBOutlet weak var Cv_Plc2: UICollectionView!
    
    var plcFilter = Array<Model_Foru>()
    var plcFilter2 = Array<Model_Foru>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataForu.inicializandoArrelgoForu()
        plcFilter = DataForu.model_foru
        plcFilter2 = DataForu.model_foru
        
        Cv_Plc.delegate = self
        Cv_Plc.dataSource = self
        
        Cv_Plc2.delegate = self
        Cv_Plc2.dataSource = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Places")
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        if collectionView == self.Cv_Plc {
            return plcFilter.count
        }
        return plcFilter2.count
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if collectionView == self.Cv_Plc {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Foru_cell3", for: indexPath) as! PlcCell
            
            cell.lbl_myName.text = plcFilter[indexPath.row].name
            cell.lbl_myPlace.text = plcFilter[indexPath.row].place
            cell.lbl_myReview.text =  plcFilter [indexPath.row].review
            if let imagen = plcFilter[indexPath.row].img{
                cell.img_myImage.image = UIImage(named : imagen)}
            
            
            return cell
        }
            
        else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Foru_cell4", for: indexPath) as! PlcCell2
            
            cell2.lbl_myName2.text = plcFilter2[indexPath.row].name
            cell2.lbl_myPlace2.text = plcFilter2[indexPath.row].place
            cell2.lbl_myReview2.text =  plcFilter2 [indexPath.row].review
            if let imagen = plcFilter2[indexPath.row].img{
                cell2.img_myImage2.image = UIImage(named : imagen)}
            
            return cell2
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToDetail4"{
            
            let controllerDestination = segue.destination as? DetailForu
            let indexPath = Cv_Plc.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let foruDestination = plcFilter [indexPath!.row]
            controllerDestination?.foru = foruDestination
            
            
        }else if segue.identifier == "goToDetail5"{
            
            let controllerDestination2 = segue.destination as? DetailForu
            let indexPath2 = Cv_Plc2.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let foruDestination2 = plcFilter2 [indexPath2!.row]
            controllerDestination2?.foru = foruDestination2
            
            
        }
        
        
    }
    
    
    
    
}
