//
//  Test.swift
//  myapp
//
//  Created by interface on 2018/7/3.
//  Copyright © 2018 interface. All rights reserved.
//

import UIKit

@IBDesignable
class Test: UIView {
    
    @IBOutlet var content: UIView!
    
    
    @IBAction func clickMe(_ sender: Any) {
        print("我已经被点击")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromXIB()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromXIB()
    }
    
    func initFromXIB() {
        print("OK")
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Test", bundle: bundle)
        content = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        content.frame = bounds
        self.addSubview(content)
        
    }
}
