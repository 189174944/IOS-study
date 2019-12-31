//
//  VedioViewController.swift
//  myapp
//
//  Created by interface on 2019/12/27.
//  Copyright © 2019 interface. All rights reserved.
//

import UIKit
import MediaPlayer

class VideoViewController1: UIViewController {


    @IBOutlet var myView: UIView!
    var avItem: AVPlayerItem? = nil;
    var player: AVPlayer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("显示了")
        print("加载了", URL(fileURLWithPath: Bundle.main.path(forResource: "douyin", ofType: "MP4")!))
        avItem = AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "douyin", ofType: "MP4")!))
        player = AVPlayer(playerItem: avItem)
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        layer.frame = self.view.bounds
        myView.layer.addSublayer(layer)
        player?.play()
        NotificationCenter.default.addObserver(self, selector: #selector(playEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    override func viewWillAppear(_ animated: Bool) {
        player?.pause()
    }
    override func viewDidAppear(_ animated: Bool) {
        player?.play()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func playEnd() {
        avItem?.seek(to: CMTime.zero, completionHandler: nil)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
