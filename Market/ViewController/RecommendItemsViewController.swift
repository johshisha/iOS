//
//  RecommendItemsViewController.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class RecommendItemsViewController: UITableViewController {
    let items: [Item] = [
        Item(id: 1, name: "おたま", desc: "おたまです", price: 100, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 2, name: "しゃもじ", desc: "しゃもじです", price: 200, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 3, name: "菜箸", desc: "菜箸です", price: 300, imageURL: NSURL(string: "http://example.com")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //indexPath：セクション等の情報を持つ。indexPath.row:number of row
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else {
            fatalError("Invalid cell")
        }
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
        
        return cell
    }
    




}
