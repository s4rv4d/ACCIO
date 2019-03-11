//
//  MySubscriptionsViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MySubscriptionsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var subscritionTBView: UITableView!
    
    //MARK: - Variables
    var subs:[Subscription] = [Subscription(Name: "Spotify", imageName: "spotify", cost: 130),
                               Subscription(Name: "Netflix", imageName: "netflix", cost: 800),
                               Subscription(Name: "Reliance Jio", imageName: "jio", cost: 400),
                               Subscription(Name: "Apple Music", imageName: "am", cost: 130),
                               ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegateAndDatasource()
        subscritionTBView.reloadData()
    }


}

extension MySubscriptionsViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY SUBSCRIPTIONS")
    }
}

extension MySubscriptionsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = subscritionTBView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MySubscriptionTableViewCell else{
            fatalError("couldnt init cell")
        }
        cell.cellLabelName.text = subs[indexPath.row].Name
        cell.cellImageView.image = UIImage(named: subs[indexPath.row].imageName)
        cell.cellProdCost.text = "Rs \(subs[indexPath.row].cost)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func delegateAndDatasource(){
        subscritionTBView.delegate = self
        subscritionTBView.dataSource = self
    }
}
