//
//  MainViewController.swift
//  myapp
//
//  Created by interface on 2018/7/13.
//  Copyright © 2018 interface. All rights reserved.
//

import UIKit
//import MyLib
import AFNetworking
import HandyJSON


class BasicTypes: HandyJSON {
    var origin: String?

    required init() {}
}

class MainViewController: UIViewController,Abc{
    func myClicked() {
        print("Wangpengyu")
    }
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBAction func refreshStop(_ sender: Any) {
        print("stop")
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        if refreshControl1.isRefreshing {
            refreshControl1.endRefreshing()
        }
    }

    
    
    var xxxm:Int = 100
    @IBOutlet var xxx: Test!
    
    @IBOutlet weak var mytableVIew: UITableView!
    
    
    var refreshControl = UIRefreshControl.init()
    var refreshControl1 = UIRefreshControl.init()

    
    var mm:UILabel = {
        let btn = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        btn.text="Hello World"
        btn.textColor=UIColor.red
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    NSHomeDirectory()
//        NSTemporaryDirectory()
//        网络请求
        
    
        
        
        let myview = MyView(frame: CGRect(x: 0, y: 200, width: 300, height: 300))
        
        myview.setOnClickedListener(x2: self)
        
        self.view.addSubview(myview);
        
        
        let af = AFHTTPSessionManager()
        af.get("http://httpbin.org/get", parameters: nil, progress: { (x) in
            print("处理中")
        }, success: { (x, y) in
//            if let xx = JSONDeserializer<BasicTypes>.deserializeFrom(json: y){
//                print(xx.origin)
//            }
            print((y! as? [String : Any])!["origin"]!)
        }) { (task, error) in
            print("error",error)
        }
        
        self.view.addSubview(mm)
        let rect = CGRect(x: 200, y: 100, width: 100, height: 100);
        let view1:UIView = UIView(frame: rect)
        view1.backgroundColor = UIColor.red
        
        let rect2 = CGRect(x: 0, y: 0, width: 50, height: 50);
        let view2:UIView = UIView(frame: rect2)
        view2.backgroundColor = UIColor.blue
        
        view1.addSubview(view2)
    
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        myImageView.image = UIImage(named: "xxx")
        
        let mybar = UINavigationBar(frame: CGRect(x: 0, y:100 , width: UIScreen.main.bounds.width, height: 400))
        
        mybar.setItems([UINavigationItem(title: "OK000"),UINavigationItem(title: "OK")], animated: true)
    
        

        self.view.addSubview(view1)
        self.view.addSubview(myImageView)
//        self.view.addSubview(mybar)
        
        refreshControl.attributedTitle=NSAttributedString.init(string: "下拉刷新")
        refreshControl1.attributedTitle=NSAttributedString.init(string: "下拉刷新")

        mytableVIew.dataSource = self
        mytableVIew.delegate=self
        mytableVIew.refreshControl = refreshControl
        
        myCollectionView.refreshControl = refreshControl1

        
//        let p = Person()
//        p.say()
        self.view.backgroundColor=UIColor.systemBackground
//        let myView = Test(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
//        myView.backgroundColor = UIColor.red
//        self.view.addSubview(myView)
//        print("MainView初始化完成!")
//        print("设备标识符",UIDevice.init().identifierForVendor!)

    }
    
    @IBAction func toiView(_ sender: Any) {
        self.performSegue(withIdentifier: "nnn", sender: "abcdef22334")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "nnn" {
            let contactVC = segue.destination as! iViewController
            contactVC.x=sender as? String
                }
    }
    
    @IBAction func getSegue(segue : UIStoryboardSegue){
        if segue.identifier == "mmmm"{
            print("返回了")
        }
    }
}


extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 90
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:myCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath) as! myCollectionViewCell
        return cell
    }
}


extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell? = mytableVIew.dequeueReusableCell(withIdentifier: "abcdef") as? MyTableViewCell
        cell!.textLabel?.text="Hello world"
        cell!.mytableViewCell.text="00000"
        return cell!
    }
}
