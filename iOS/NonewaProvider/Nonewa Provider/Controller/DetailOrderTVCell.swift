//
//  DetailOrderTVCell.swift
//  Nonewa Provider
//
//  Created by Doan on 1/3/18.
//  Copyright © 2018 Nonewa. All rights reserved.
//

import UIKit

class DetailOrderTVCell: UITableViewCell {

    @IBOutlet weak var menuNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var subTotalAmountLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
