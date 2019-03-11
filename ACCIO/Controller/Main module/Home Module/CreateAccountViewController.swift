//
//  CreateAccountViewController.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/11/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    //Variables
    var accs:[Credit]!
    
    //MARK: - IBOutlets
    @IBOutlet weak var creditCardView: UIView!
    @IBOutlet weak var upiCardView: UIView!
    @IBOutlet weak var netBankingVew: UIView!
    //back arrow
    @IBOutlet weak var backArrowView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        shadowsForView()
        setupGestureRecog()
    }
    
    //MARK: - Functions
    func setupGestureRecog(){
        //arrow
        let arrowGesture = UITapGestureRecognizer(target: self, action: #selector(self.arrowTapped))
        backArrowView.isUserInteractionEnabled = true
        backArrowView.addGestureRecognizer(arrowGesture)
        
        //credit card
        let creditCardGesture = UITapGestureRecognizer(target: self, action: #selector(self.creditCardTapped))
        creditCardView.isUserInteractionEnabled = true
        creditCardView.addGestureRecognizer(creditCardGesture)
    }
    
    func shadowsForView(){
        creditCardView.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        creditCardView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        creditCardView.layer.shadowOpacity = 1.0
        creditCardView.layer.shadowRadius = 3.0
        creditCardView.layer.masksToBounds = false
        creditCardView.layer.cornerRadius = 5
        
        upiCardView.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        upiCardView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        upiCardView.layer.shadowOpacity = 1.0
        upiCardView.layer.shadowRadius = 3.0
        upiCardView.layer.masksToBounds = false
        upiCardView.layer.cornerRadius = 5
        
        netBankingVew.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        netBankingVew.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        netBankingVew.layer.shadowOpacity = 1.0
        netBankingVew.layer.shadowRadius = 3.0
        netBankingVew.layer.masksToBounds = false
        netBankingVew.layer.cornerRadius = 5
    }
    
    //MARK: - Gesture functions
    @objc func arrowTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func creditCardTapped(){
        //go to next page
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddCCViewController") as? AddCCViewController else{
            fatalError("couldnt init")
        }
        self.present(vc, animated: true, completion: nil)
    }
}
