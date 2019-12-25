import UIKit
import WebKit
import iAd

class ShopViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var myWebView: WKWebView!
    var x:[[String:Any]] = [
    ]
    var refreshing:Bool = true
    
//    当前页
    var page:Int = 0
    
    //    加载数据
    func loadData(page:Int,first:Bool=false){
        if first==true {
            x=[
                ["shop":"苹果手机","price":20],
                ["shop":"小米手机","price":50],
                ["shop":"阿斯顿发","price":60],
                ["shop":"asdsad","price":70]
            ]
            self.page=1
        }else{
            x.append(["shop":"asdsad","price":70])
            self.page = self.page+1
        }
        myCollectionView.reloadData()

    }
//    首次进入加载数据
    func initData(){
        loadData(page: 1,first: true)
    }
    
    @objc func refresh(){
        refreshing = true
        loadData(page: page, first: true)
        rc.endRefreshing()
        refreshing = false
    }
    
    
    let rc = UIRefreshControl()
    
    
    
    lazy var myCollectionView = {()->UICollectionView in
        var myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: (Utils.width-8)/3, height: 200)
        myLayout.minimumLineSpacing=4
        myLayout.minimumInteritemSpacing=4
        myLayout.sectionInset=UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        var m = UICollectionView(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 400), collectionViewLayout: myLayout)
        m.backgroundColor = UIColor.init(cgColor: CGColor(srgbRed: 247, green: 247, blue: 147, alpha: 1))
        var xx = UIView(frame: CGRect(x: 0, y: 0, width: Utils.width, height: 100))
        xx.backgroundColor = UIColor.red
        m.addSubview(xx)
        m.refreshControl = rc
        return m
    }()
    
    var name:String?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
//        加载数据
        initData()
        
        
        rc.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        

        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "ShopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "shopCell")
        
        
        self.view.addSubview(myCollectionView)
//        Webkit的使用
//        myWebView.load(URLRequest(url: URL(string: "http://www.baidu.com")!))
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


extension ShopViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return x.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopCollectionViewCell
        let shopTitle:UILabel = cell.viewWithTag(1) as! UILabel
        let shopPrice:UILabel = cell.viewWithTag(2) as! UILabel
        
        shopTitle.text = x[indexPath.row]["shop"] as? String
        shopPrice.text = "\(String(describing: x[indexPath.row]["price"]!))"
        print(x[indexPath.row]["price"]!)
        print("行:",indexPath.row)
//        上拉加载更多
//        if refreshing==false {
//            if indexPath.row>indexPath.row-2 {
//                self.loadData(page: page,first: false)
//            }
//        }
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "shopDetail")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func shopDetail(segue : UIStoryboardSegue){
    }
}
