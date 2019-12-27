//
//  iViewController.swift
//  myapp
//
//  Created by interface on 2019/10/13.
//  Copyright © 2019 interface. All rights reserved.
//

import UIKit

class iViewController: UIViewController {

    var x:String?
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel!.text=x
        // Do any additional setup after loading the view.
    }


    @IBAction func backTo(_ sender: Any) {
//        performSegue(withIdentifier: "mmmm", sender: nil)
    }
}
