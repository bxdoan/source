//
//  OrderTVCell.swift
//  Nonewa Provider
//
//  Created by Doan on 12/28/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit

class OrderTVCell: UITableViewCell {

    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var paymentStyle: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
