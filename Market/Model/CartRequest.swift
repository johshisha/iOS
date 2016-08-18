import Foundation
import APIKit
import Himotoki

struct CartRequest: MarketRequestType {
    typealias Response = Cart
    var orderID = 2
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        print(orderID)
        return "/orders/\(orderID).json"
    }
    
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        print(object)
        return try decodeValue(object)
    }

    
}
