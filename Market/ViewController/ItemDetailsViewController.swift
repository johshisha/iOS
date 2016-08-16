//
//  ItemDetailsViewController.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class ItemDetailsViewController: UIViewController {
    var itemID: Int = 0
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var navBar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        print(itemID)
        let request = ItemDetailsRequest(itemID: itemID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response): //response => Item
//                print(response)
                self.update(withItem: response)
            case .Failure(let error):
                print(error)
            }
        }

    }
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
        imageView.sd_setImageWithURL(item.imageURL)
        navBar.title = item.name
    }


}
