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
    var item: Item!
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var cartButton: UIButton!

    @IBAction func touchButtonAction(sender: AnyObject) {
        var count = 0
        if (Singleton.sharedInstance.cart_items[self.item.id] != nil) {
            count = Singleton.sharedInstance.item_count[self.item.id]!
        }
        Singleton.sharedInstance.cart_items[self.item.id] = self.item
        Singleton.sharedInstance.item_count[self.item.id] = count + 1
        
        print(Singleton.sharedInstance.cart_items[self.item.id])
        print(Singleton.sharedInstance.item_count[self.item.id])
        let alert: UIAlertController = UIAlertController(title: "確認", message: "カートに追加しました", preferredStyle:  UIAlertControllerStyle.ActionSheet)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        presentViewController(alert, animated: true, completion: nil)
    }

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
                self.item = response
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
        navigationItem.title = item.name
    }


}
