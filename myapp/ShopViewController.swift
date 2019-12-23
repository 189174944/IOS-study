//
//  ShopViewController.swift
//  myapp
//
//  Created by interface on 2019/12/23.
//  Copyright © 2019 interface. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    var name:String?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
    }
    @IBAction func back(_ sender: Any) {
//        self.performSegue(withIdentifier: "myexit", sender: "mysender")
//        self.navigationController?.popToViewController(MainViewController(), animated: true)
//        跳转到上级的第n个页面
        let xxx = (self.navigationController?.viewControllers)!;
        let index = xxx.firstIndex(of: self)!
        print(index)
        self.navigationController?.popToViewController(xxx[index-1], animated: true)
    }
}
