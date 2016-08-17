//
//  CartCell.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/17.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func update(withCart cart: Cart) {
        nameLabel.text = cart.name
        priceLabel.text = "\(cart.price)円"
        quantityLabel.text = "数量: d\(cart.quantity)"
        thumbnailImageView.sd_setImageWithURL(cart.imageURL)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
