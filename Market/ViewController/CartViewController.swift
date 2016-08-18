//
//  CartViewController.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/17.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CartViewController: UITableViewController {
    
    var line_items: [Line_Items] = [] {
        didSet {
            tableView.reloadData() //itemが更新されたらtable reload
        }
    }
    
//    let carts: [Cart] = [
//        Cart(id: 1, name: "おたま", price: 100, quantity: 1, imageURL: NSURL(string: "http://example.com")!),
//            Cart(id: 2, name: "しゃもじ", price: 200, quantity: 2, imageURL: NSURL(string: "http://example.com")!),
//            Cart(id: 3, name: "菜箸", price: 300, quantity: 1, imageURL: NSURL(string: "http://example.com")!),
//        ]
    var orderID = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewWillAppear:画面が出る直前の処理, viewDidAppear:画面が出た直後の処理
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        let request = CartRequest(orderID: orderID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                let carts = response
                self.line_items = carts.line_items
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return line_items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath) as? CartCell else { //classの型の確認
            fatalError("Invalid cell")
        }
        
        let line_item = line_items[indexPath.row]
        cell.update(withLine_Item: line_item)
        
        return cell
    }
    
    
//    //ItemDetailsControllerにidを送信   遷移線：seque
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destination = segue.destinationViewController as? ItemDetailsViewController {
//            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
//                return
//            }
//            
//            let cart = carts[selectedIndexPath.row]
//            destination.orderID = cart.id
//        }
//    }
//

}
