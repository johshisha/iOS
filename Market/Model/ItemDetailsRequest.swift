
import Foundation
import APIKit
import Himotoki

struct ItemDetailsRequest: MarketRequestType {
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
}
