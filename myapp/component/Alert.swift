//
//  Alert.swift
//  myapp
//
//  Created by interface on 2020/1/7.
//  Copyright © 2020 interface. All rights reserved.
//

import UIKit

class Alert: NSObject {
    class func showAlert(context:UIViewController,title:String,message:String,ensureCallable:@escaping (_ action:UIAlertAction)->(),presentCallable:@escaping ()->()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let ensureAction = UIAlertAction(title: "确定", style: .default, handler: ensureCallable)
        alert.addAction(cancelAction)
        alert.addAction(ensureAction)
        context.present(alert, animated: true, completion: presentCallable)
    }
}
