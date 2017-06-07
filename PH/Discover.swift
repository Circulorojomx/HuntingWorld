//
//  Discover.swift
//  PH
//
//  Created by Mawe Tecnologias on 17/02/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip


class Discover: ButtonBarPagerTabStripViewController {
    
    let gray = UIColor(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1.0)
    let darkGray = UIColor(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Raleway-Light", size: 17)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .black
        settings.style.buttonBarItemBackgroundColor = .black
        settings.style.selectedBarBackgroundColor = UIColor(red: 127/255.0, green: 109/255.0, blue: 77/255.0, alpha: 1.0)
        settings.style.buttonBarItemFont = UIFont(name: "Raleway-Light", size:14) ?? UIFont.systemFont(ofSize: 14)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        
        settings.style.buttonBarLeftContentInset = 20
        settings.style.buttonBarRightContentInset = 20
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white //UIColor(red: 138/255.0, green: 138/255.0, blue: 144/255.0, alpha: 1.0)
            newCell?.label.textColor = UIColor(red: 127/255.0, green: 109/255.0, blue: 77/255.0, alpha: 1.0)
        }
        super.viewDidLoad()
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child2")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child3")
        return [child_1, child_2, child_3]
    }
    

}
