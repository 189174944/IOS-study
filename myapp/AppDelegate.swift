//
//  AppDelegate.swift
//  myapp
//
//  Created by interface on 2018/7/2.
//  Copyright © 2018 interface. All rights reserved.
//

import UIKit
import CoreLocation
import Reachability


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var x:Int = 1000;
    var window: UIWindow?
    var locationManager:CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        loadLocation()
        print("版本",UIDevice.current.systemVersion)

//        NotificationCenter.default.addObserver(self, selector: #selector("xxx"), name: kReachabilityChangedNotification, object: nil)
        return true
    }
    
    @objc func xxx(){
        print("")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        locationManager?.stopUpdatingLocation()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate:CLLocationManagerDelegate{
    func loadLocation(){
        print("OK")
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        if(UIDevice.current.systemVersion >= "8.0"){
                //始终允许访问位置信息
            locationManager!.requestAlwaysAuthorization()
                //使用应用程序期间允许访问位置数据
            locationManager!.requestWhenInUseAuthorization()
            }
            //开启定位
        locationManager!.startUpdatingLocation()
    }
}
