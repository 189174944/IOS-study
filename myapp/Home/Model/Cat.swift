//
//  Cat.swift
//  myapp
//
//  Created by interface on 2020/1/3.
//  Copyright © 2020 interface. All rights reserved.
//
import HandyJSON


class Response: HandyJSON {
    var code: Int?
    var data: [Cat]?
    var info: String?

    required init() {}
}

class Cat: HandyJSON{
    var name: String?
    var id: Int?
    var color: String?

    required init() {}
}


class LoginResponse: HandyJSON {
    var code: Int?
    var data: LoginInfo?
    var info: String?

    required init() {}
}

class LoginInfo: HandyJSON{
    var token: String?
    required init() {}
}
