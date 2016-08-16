
import Foundation
import APIKit
import Himotoki

struct ItemDetailsRequest: MarketRequestType {
    typealias Response = Item
    var itemID = 1
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/\(itemID).json"
    }
    
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
