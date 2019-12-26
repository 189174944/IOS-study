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
import KJBannerView

class BasicTypes: HandyJSON {
    var origin: String?

    required init() {}
}

class MainViewController: UIViewController,Abc{
    var temp:[Any] = []
    var images:[Any] = ["http://localhost/xyz.jpg","http://localhost/xyz.jpg","http://localhost/xyz.jpg","http://localhost/xyz.jpg"]
    
    func myClicked() {
        print("点击了")
//        self.performSegue(withIdentifier: "pppp", sender: nil)

        let my:ShopViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "myabc")
        my.name="-______----___"
        self.navigationController?.pushViewController(my, animated: true)
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
    
    @IBOutlet weak var myView: MyView!
    
    
    
    var i:Int = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        setUpBanner()

//    NSHomeDirectory()
//        NSTemporaryDirectory()
//        网络请求
        
    
        
        
//        let myview = MyView(frame: CGRect(x: 0, y: 200, width: 300, height: 300))
        myView.setOnClickedListener(x2: self)
//        self.view.addSubview(myview);
        
        
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
        
        
        
        
                
////                移除所有view
//        for view in self.view.subviews {
//            print(view)
//        //             if view is UILabel {
//        //                 view.removeFromSuperview()
//        //             }
//            view.removeFromSuperview()
//        }
//
//        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
//        label.text="Hello World"
//        self.view.addSubview(label)

    }
    
    @IBAction func toiView(_ sender: Any) {
        self.performSegue(withIdentifier: "nnn", sender: "abcdef22334")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("OK")
        if segue.identifier == "nnn" {
            let contactVC = segue.destination as! iViewController
            contactVC.x=sender as? String
        }
        
        if segue.identifier == "pppp" {
            let sc = segue.destination as! ShopViewController
          }
        
    }
    
    @IBAction func getSegue(segue : UIStoryboardSegue){
        print(segue.identifier)
        if segue.identifier == "mmmm"{
            print("返回了")
        }
  

    }
    
    @IBAction func getSegue001(segue : UIStoryboardSegue){
        print("segue2",segue.destination is MainViewController)
        print(segue)
        if segue.identifier=="pppp" {
            print("返回了222")
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


//轮播图设置

extension MainViewController:KJBannerViewDelegate{
    public func setUpBanner(){
        let kv:KJBannerView = KJBannerView(frame: CGRect(x: 50, y: 700, width: self.view.frame.size.width-100, height: 80))
        kv.autoScroll = true
        kv.autoScrollTimeInterval=3
        kv.itemSpace=10
        kv.imgCornerRadius = 10
        kv.pageControl.pageType = PageControlStyleRectangle
        kv.delegate = self
        kv.imageDatas = images
        kv.imageType=KJBannerViewImageType.mix
        kv.itemWidth = self.view.frame.size.width-120;
        kv.kSelectBlock = { (kv,i) in
            print(i)
        }
        self.view.addSubview(kv)
        kv.isHidden = true
    }
    
    func kj_BannerView(_ banner: KJBannerView, bannerViewCell bannercell: KJBannerViewCell, imageDatas: [Any], index: Int) {
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("appear")
    }
}
