//
//  HomeViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Page striper function
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MySubscriptionsViewController")
        let child2 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyAccountViewController")
        return [child1,child2]
    }
    
    func loadDesign(){
//        self.buttonBarView
        self.settings.style.buttonBarHeight = 90
        self.settings.style.selectedBarVerticalAlignment = .bottom
//        self.settings.style.selectedBarHeight =
        self.settings.style.selectedBarHeight = 4
        self.settings.style.selectedBarBackgroundColor = UIColor.init(254, 130, 80, 1)
        self.settings.style.buttonBarBackgroundColor = UIColor.init(51, 1, 54, 1)
        self.settings.style.buttonBarItemBackgroundColor = UIColor.init(51, 1, 54, 1)
//        self.settings.style.selectedBar
        self.settings.style.buttonBarItemFont = UIFont(name: "SFProDisplay-Bold", size: 15)!
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 0
        self.settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = {(oldCell:ButtonBarViewCell?, newCell:ButtonBarViewCell?, progressPercentage:CGFloat, changeCurrentIndex:Bool, animated:Bool) -> Void in
            guard changeCurrentIndex == true else {return}
            oldCell?.label.textColor = .white
            newCell?.label.textColor = UIColor.init(254, 130, 80, 1)
        }
        
    }

}
