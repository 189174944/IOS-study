//
//  NetUtil.swift
//  myapp
//
//  Created by interface on 2020/1/6.
//  Copyright © 2020 interface. All rights reserved.
//

import AFNetworking
import HandyJSON
import SwiftyJSON

//网络请求
class NetUtil {
    static let protocal:String = "http://"
    static let domain:String = "127.0.0.1"
    static var mainHost:String {
        get{
            return "\(NetUtil.self.protocal)\(NetUtil.self.domain)"
        }
    }
}

//let jsonString = "{\"id\":12345,\"color\":\"black\",\"name\":\"cat\"}"
//if let cat = JSONDeserializer<Cat>.deserializeFrom(json: jsonString) {
//    print(cat.name!)
//}


extension NetUtil{
        class func get() {
            let af = AFHTTPSessionManager()
            print("start")
            af.get(mainHost, parameters: nil, progress: { (x) in
                print("处理中")
            }, success: { (x, y) in
                if let cat = JSONDeserializer<Cat>.deserializeFrom(json: y as? String){
                    print(cat.name!)
                }
                
//                let cat = JSONDeserializer<Cat>.deserializeFrom(dict: )
//                print(JSON(y!)["a"])
                
                }) { (task, error) in
                print("error:", error)
            }
            
            Al
        }
}
