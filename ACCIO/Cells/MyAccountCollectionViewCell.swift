//
//  MyAccountCollectionViewCell.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/11/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class MyAccountCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var cView: UIView!
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountValue: UILabel!
    
    //MARK: - IBActions
    @IBAction func viewDetailsTapped(_ sender: UIButton) {
        print("tapped")
    }
    
    //MARK: - Functions
    func cellSetup(){
        cView.layer.cornerRadius = 4
        cView.layer.masksToBounds = false
        cView.layer.shadowColor = UIColor.init(51, 1, 54, 0.16).cgColor
        cView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cView.layer.shadowOpacity = 1.0
        cView.layer.shadowRadius = 3.0
        cView.layer.masksToBounds = false
        cView.layer.cornerRadius = 8
    }
    
}
