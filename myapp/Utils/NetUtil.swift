//
//  NetUtil.swift
//  myapp
//
//  Created by interface on 2020/1/6.
//  Copyright © 2020 interface. All rights reserved.
//
import HandyJSON
//import SwiftyJSON
import Alamofire

//网络请求
class NetUtil{
    class func request(url:String,method:HTTPMethod,params:Dictionary<String,Any>,callbackSuccess :@escaping (_ str:String)->(), callbackFailure :@escaping (_ err:Error)->()){
        AF.request(url,method: method,parameters: params).responseString{ response in
            switch response.result{
            case .success(let json) :
                callbackSuccess(json)
            case .failure(let error):
                print("error:\(error)")
                callbackFailure(error)
            }
        }
    }
}


class Api{
    static var prefix = "/api"
    static var host = "http://127.0.0.1\(Api.self.prefix)"
//    获取用户信息
    static var getUserInfo:String = "\(Api.self.host)/getUserInfo"
//    登陆
    static var login:String = "\(Api.self.host)/login"
}
