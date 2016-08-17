import Foundation
import APIKit
import Himotoki

struct CategoryItemsRequest: MarketRequestType {
    typealias Response = [Item] //Request.Response
    var categoryID = 0
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        print("/categories/\(categoryID)/items.json")
        return "/categories/\(categoryID)/items.json"
    }
    
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
    
}
