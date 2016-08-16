//
//  RecommendItemCell.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class RecommendItemCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
    }
}
