import UIKit

class Singleton: NSObject {

    var cart_items = Dictionary<Int, Item>()
    var item_count = Dictionary<Int, Int>()

    
    /** シングルトンでインスタンスを返す */
    class var sharedInstance:Singleton{
        struct Static{
            static let instance:Singleton = Singleton()
        }
        return Static.instance
    }
    
    // initのプライベート化。インスタンスの作成・取得はsharedInstanceを利用する。
    override private init() {
        super.init()
    }
    
}