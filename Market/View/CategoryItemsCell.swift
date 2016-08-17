//
//  CategoryItemsCell.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CategoryItemsCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        imageView.sd_setImageWithURL(item.imageURL)
    }

}
