import Foundation
import APIKit
import Himotoki

struct RecommendItemsRequest: MarketRequestType {
    // ---実装しなきゃいけない---kokokara
    typealias Response = [Item] //Request.Response
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/recommended.json"
    }
    
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object) //ResponseはItemリストだとわかっているから。Itemのdecodeを呼ぶ
    }
    
//    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
//        guard let itemDicts = object as? [[String: AnyObject]] else {
//            throw ResponseError.UnexpectedObject(object)
//        }
//        
//        let items: [Item] = itemDicts.map { dict in
//            let id = dict["id"] as! Int
//            let name = dict["name"] as! String
//            let desc = dict["description"] as! String
//            let price = dict["price"] as! Int
//            let imageURLString = dict["image_url"] as! String
//            let imageURL = NSURL(string: imageURLString)!
//            
//            return Item(id: id, name: name, desc: desc, price: price, imageURL: imageURL)
//        }
//        
//        return items
//    }
    // ---kokomade---
    
}
