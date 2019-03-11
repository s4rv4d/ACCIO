//
//  MySubscriptionTableViewCell.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/11/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class MySubscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelName: UILabel!
    @IBOutlet weak var cellProdCost: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
