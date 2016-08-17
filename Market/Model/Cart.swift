import Foundation
import Himotoki

struct Cart {
    let id: Int
    let name: String
    let price: Int
    let quantity: Int
    let imageURL: NSURL
}

extension Cart: Decodable {
    static let URLTransformer = Transformer<String, NSURL> { URLString throws -> NSURL in
        if let URL = NSURL(string: URLString) {
            return URL
        }
        throw customError("Invalid URL string: \(URLString)")
    }
    
    static func decode(e: Extractor) throws -> Cart {
        return try Cart(id: e <| "id",
                        name: e <| "name",
                        price: e <| "price",
                        quantity: e <| "quantity",
                        imageURL: URLTransformer.apply(e <| "image_url"))
    }
    
}