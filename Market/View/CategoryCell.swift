//
//  CategoryCell.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import WebImage

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func update(withCategory category: Category) {
        nameLabel.text = category.name
        categoryImageView.sd_setImageWithURL(category.imageURL)
    }
}
