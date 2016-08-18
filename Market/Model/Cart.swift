import Foundation
import Himotoki


struct Cart {
    let id: Int
    let line_items: [Line_Items]
    let total: Int
}


struct Line_Items {
    let line_item: Line_Item
    let quantity: Int
}



struct Line_Item {
    let id: Int
    let name: String
    let price: Int
//    let imageURL: NSURL
}

extension Line_Item: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Line_Item {
        return try Line_Item(id: e <| "id",
                        name: e <| "name",
                        price: e <| "price")
//                        imageURL: URLTransformer.apply(e <| "image_url"))
    }
    
}
extension Cart: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Cart {
        return try Cart(
            id: e <| "id",
            line_items: e <|| ["line_items"],
            total: e <| "total"
        )
    }
    
}

extension Line_Items: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Line_Items {
        return try Line_Items(
            line_item: e <| "item",
            quantity: e <| "quantity"
        )
    }
}
