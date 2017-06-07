//
//  Discover_Child1.swift
//  PH
//
//  Created by Mawe Tecnologias on 17/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class Foru: UIViewController, IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var foruFilter = Array<Model_Foru>()
    var foruFilter2 = Array<Model_Foru>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataForu.inicializandoArrelgoForu()
        foruFilter = DataForu.model_foru
        foruFilter2 = DataForu.model_foru
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "For You")
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        if collectionView == self.collectionView {
            return foruFilter.count
        }
        return foruFilter2.count
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if collectionView == self.collectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Foru_cell", for: indexPath) as! ForuCell
        
        cell.lbl_myName.text = foruFilter[indexPath.row].name
        cell.lbl_myPlace.text = foruFilter[indexPath.row].place
        cell.lbl_myReview.text =  foruFilter [indexPath.row].review
        if let imagen = foruFilter[indexPath.row].img{
            cell.img_myImage.image = UIImage(named : imagen)}
        
        
            return cell
        }
            
        else{
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Foru_cell2", for: indexPath) as! ForuCell2
        
            cell2.lbl_myName2.text = foruFilter[indexPath.row].name
            cell2.lbl_myPlace2.text = foruFilter2[indexPath.row].place
            cell2.lbl_myReview2.text =  foruFilter2 [indexPath.row].review
            if let imagen = foruFilter2[indexPath.row].img{
                cell2.img_myImage2.image = UIImage(named : imagen)}
            
            return cell2
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToDetail"{
            
            let controllerDestination = segue.destination as? DetailForu
            let indexPath = collectionView.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let foruDestination = foruFilter [indexPath!.row]
            controllerDestination?.foru = foruDestination
            
            
        }else if segue.identifier == "goToDetail2"{
        
            let controllerDestination2 = segue.destination as? DetailForu
            let indexPath2 = collectionView2.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let foruDestination2 = foruFilter2 [indexPath2!.row]
            controllerDestination2?.foru = foruDestination2
        
        
        }
        
        
    }
    
    
    
    
}
