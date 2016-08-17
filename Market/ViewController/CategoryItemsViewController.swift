//
//  CategoryItemsViewController.swift
//  Market
//
//  Created by satoshi-sanjo on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CategoryItemsViewController: UICollectionViewController {

    var items: [Item] = [] {
        didSet {
            collectionView!.reloadData() //itemが更新されたらtable reload
        }
    }
    
    var categoryID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewWillAppear:画面が出る直前の処理, viewDidAppear:画面が出た直後の処理
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoryItemsRequest(categoryID: categoryID)
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
    
    // セルが表示されるときに呼ばれる処理（1個のセルを描画する毎に呼び出されます
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CategoryItemsCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CategoryItemsCell
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
        return cell
    }
    
    // セクションの数（今回は1つだけです）
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 表示するセルの数
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    //ItemDetailsControllerにidを送信   遷移線：seque
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ItemDetailsViewController {
            guard let selectedIndexPath = collectionView!.indexPathForCell((sender as? UICollectionViewCell)!) else {
                return
            }
            
            let item = items[selectedIndexPath.row]
            destination.itemID = item.id
        }
    }
    
    
    
    
}
