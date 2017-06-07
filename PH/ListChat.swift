//
//  MenuChat.swift
//  PH
//
//  Created by Mawe Tecnologias on 12/03/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit

class ListChat:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var Cv_Lchat: UICollectionView!
    
    
    var LchatFilter = Array<Model_Foru>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        DataForu.inicializandoArrelgoForu()
        LchatFilter = DataForu.model_foru
        
        
        Cv_Lchat.delegate = self
        Cv_Lchat.dataSource = self
        
        
    }
    
    
    
    /*public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }*/
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return LchatFilter.count
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LChat_cell", for: indexPath) as! ChatCell
        
        cell.lbl_NameChat.text = LchatFilter[indexPath.row].name
        if let imagen = LchatFilter[indexPath.row].img{
            cell.img_ProfileChat.image = UIImage(named : imagen)}
        
        cell.img_ProfileChat.layer.cornerRadius = cell.img_ProfileChat.frame.size.width / 2
        cell.img_ProfileChat.clipsToBounds = true
        cell.img_ProfileChat.layer.borderWidth = 3.0
        
        let myColor : UIColor = UIColor.white
        cell.img_ProfileChat.layer.borderColor = myColor.cgColor
        return cell
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToChat"{
            
            /*let controllerDestination = segue.destination as? Chat
            let indexPath = Cv_Lchat.indexPath(for: (sender as? UICollectionViewCell)!)
            
            let foruDestination = LchatFilter [indexPath!.row]
            controllerDestination?.foru = foruDestination*/
            
            
            
            
        }
        
        
    }


}
