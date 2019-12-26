//
//  myPageViewController.swift
//  myapp
//
//  Created by interface on 2019/12/26.
//  Copyright © 2019 interface. All rights reserved.
//

import UIKit

class myPageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
          if viewController.restorationIdentifier=="page3" {
              return cv[1]
          }else if(viewController.restorationIdentifier=="page2"){
              return cv[0]
          }
          return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier=="page1" {
            return cv[1]
        }else if(viewController.restorationIdentifier=="page2"){
            return cv[2]
        }
        return nil
    }
    
    var cv:[UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...2 {
            self.cv.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "page\(i+1)"))
        }
        self.setViewControllers([cv[0]], direction: NavigationDirection.forward, animated: true, completion: nil)
        self.delegate = self
        self.dataSource = self
    }
    
    
}
