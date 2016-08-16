//
//  RecommendItemsViewController.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class RecommendItemsViewController: UITableViewController {
//    let items: [Item] = [
//        Item(id: 1, name: "おたま", desc: "おたまです", price: 100, imageURL: NSURL(string: "http://example.com")!),
//        Item(id: 2, name: "しゃもじ", desc: "しゃもじです", price: 200, imageURL: NSURL(string: "http://example.com")!),
//        Item(id: 3, name: "菜箸", desc: "菜箸です", price: 300, imageURL: NSURL(string: "http://example.com")!),
//    ]
    var items: [Item] = [] {
        didSet {
            tableView.reloadData() //itemが更新されたらtable reload
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = RecommendItemCell.height
    }
    
    //viewWillAppear:画面が出る直前の処理, viewDidAppear:画面が出た直後の処理
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = RecommendItemsRequest()
        Session.sendRequest(request) { result in
            // Result<Request.Request, SessionTaskError>: 成功と失敗の両方のモデルを持てる
            switch result {
            case .Success(let response): //response => [Item]
//                print(response)
                self.items = response
            case .Failure(let error):
                print(error)
            }
        }
    }


    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //indexPath：セクション等の情報を持つ。indexPath.row:number of row
        //tableView.dequeueReusableCellWithIdentifier: recommendItemCellの情報をとってきた
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else { //classの型の確認
            fatalError("Invalid cell")
        }
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
        
        return cell
    }
    
    
    //ItemDetailsControllerにidを送信   遷移線：seque
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ItemDetailsViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let item = items[selectedIndexPath.row]
            destination.itemID = item.id
        }
    }
    




}
