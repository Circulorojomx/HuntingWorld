//
//  ViewController.swift
//  PH
//
//  Created by Mawe Tecnologias on 16/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import UIKit
import PaperOnboarding

class Explain: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{


    @IBOutlet weak var btn_Start: UIButton!
    @IBOutlet weak var onboardingView: OnboardingView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
    }
    
    func onboardingItemsCount() -> Int { //Numero de pantalleas Mostradas
        return 3
    }
    
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo { //Color y Fuentes a Usar
        
        
        let bgColor1 = UIColor(red: 217/255, green: 72/255, blue: 89/255,alpha:0)
        
        //let image0 = UIImage(named: "")
        let image1 = UIImage(named: "1")
        let image2 = UIImage(named: "2")
        let image3 = UIImage(named: "3")
        
        let titleFont = UIFont(name:"Raleway-Bold", size:22)!
        let descriptionFont =  UIFont(name:"Raleway-Regular", size:16)!
    
        return[
            (image1,"Meet New Places","Discover the most awesome places for hunting.",image1,bgColor1,UIColor.white,UIColor.white, titleFont, descriptionFont),
            (image2,"Choose a New Home","Search for different experience.",image2,bgColor1,UIColor.white,UIColor.white, titleFont, descriptionFont),
            (image3,"Hunting","Find the best place for you.",image3,bgColor1,UIColor.white,UIColor.white, titleFont, descriptionFont)
            
            ][index] as! OnboardingItemInfo
    }
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int){
        
    }
    
    
    
    func onboardingWillTransitonToIndex(_ index: Int){
        
        
        if index == 1 {
            
            if self.btn_Start.alpha==1{
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.btn_Start.alpha = 0
                    
                })
            }
        }
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int){
        
        if index == 2{
            UIView.animate(withDuration: 0.5, animations: { self.btn_Start.alpha = 1})
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
