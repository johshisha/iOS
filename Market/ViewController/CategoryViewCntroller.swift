//
//  CategoryViewCntroller.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CategoryViewCntroller: UITableViewController {

    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewWillAppear:画面が出る直前の処理, viewDidAppear:画面が出た直後の処理
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoryRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                print(response)
                self.categories = response
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as? CategoryCell else { //classの型の確認
            fatalError("Invalid cell")
        }
        
        let category = categories[indexPath.row]
        cell.update(withCategory: category)
        
        return cell
    }
    
    
//    //ItemDetailsControllerにidを送信   遷移線：seque
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destination = segue.destinationViewController as? CategoryViewCntroller {
//            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
//                return
//            }
//            
//            let item = items[selectedIndexPath.row]
//            destination.itemID = item.id
//        }
//    }
}

