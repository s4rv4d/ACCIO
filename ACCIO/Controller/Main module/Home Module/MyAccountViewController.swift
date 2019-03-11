//
//  MyAccountViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyAccountViewController: UIViewController {
    
    //MARK: - IBOutlets
    //net worth
    @IBOutlet weak var netMoneyViewOutlet: UIView!
    @IBOutlet weak var netWorthLabel: UILabel!
    @IBOutlet weak var netWorthUpdateTimestamp: UILabel!
    
    //collection view part
    @IBOutlet weak var acountsCollectionView: UICollectionView!
    //add acc
    @IBOutlet weak var addAcountButtonOutlet: UIButton!
    
    //MARK: - Variables
    var acc:[Credit] = [Credit(accountName: "Paypal", accountNumber: "696969", expiryDate: "12/2/19", amount: 10000)]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        netMoneyViewSetup()
        addAccountButtonSetup()
        delegateAndDatasourceSetup()
        acountsCollectionView.reloadData()
    }
    
    //MARK: - Functions
    func netMoneyViewSetup(){
        netMoneyViewOutlet.layer.borderWidth = 4
        netMoneyViewOutlet.layer.borderColor = #colorLiteral(red: 1, green: 0.5884697437, blue: 0.3845948875, alpha: 1)
    }
    
    func addAccountButtonSetup(){
        addAcountButtonOutlet.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        addAcountButtonOutlet.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        addAcountButtonOutlet.layer.shadowOpacity = 1.0
        addAcountButtonOutlet.layer.shadowRadius = 3.0
        addAcountButtonOutlet.layer.masksToBounds = false
        addAcountButtonOutlet.layer.cornerRadius = 8
    }
    
    //MARK: - IBAction
    @IBAction func addAccountTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController else{
            fatalError("couldnt init storyboard")
        }
        
        vc.accs = acc
        self.present(vc, animated: true, completion: nil)
    }
    

}

extension MyAccountViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY MONEY")
    }
}

extension MyAccountViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func delegateAndDatasourceSetup(){
        acountsCollectionView.delegate = self
        acountsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return acc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = acountsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyAccountCollectionViewCell else{
            fatalError("couldnt initialise cell")
        }
        cell.accountName.text = acc[indexPath.row].accountName
        cell.accountValue.text = "\(acc[indexPath.row].amount)"
        return cell
    }
    
    
}
