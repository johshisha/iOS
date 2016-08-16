
import Foundation
import APIKit
import Himotoki

struct CategoryRequest: MarketRequestType {
    typealias Response = [Category]
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
    }
    
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
}
