//
//  MyView.swift
//  myapp
//
//  Created by interface on 2019/4/5.
//  Copyright © 2019 interface. All rights reserved.
//

import UIKit




public protocol Abc {
    func myClicked();
}

class MyView: UIView {


    @IBOutlet var content: UIView!
    
    @IBAction func click(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromXIB()
        print("frame")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromXIB()
        print("aDecoder")
//        self.backgroundColor = UIColor.red
//        self.layer.borderWidth=20
    }
    
    func initFromXIB() {
        let bundle = Bundle.init(path: "mxib")
        let nib = UINib(nibName: "MyView", bundle: bundle)
        content = nib.instantiate(withOwner: self, options: nil)[1] as? UIView
        content.frame = bounds
        self.addSubview(content)
    }
    
    
    var callable:()->Void = {};

    
    var x1 :Abc? = nil

    
    @IBAction func btnClick(_ sender: Any) {
//        callable()
        x1!.myClicked()
    }
//
//    func setClickHandler(func1:@escaping ()->Void){
//        callable = func1;
//    }
    
    func setOnClickedListener(x2:Abc) {
        x1 = x2
    }
}

