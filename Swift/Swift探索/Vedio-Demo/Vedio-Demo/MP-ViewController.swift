//
//  MP-ViewController.swift
//  Vedio-Demo
//
//  Created by 江连松 on 2017/5/25.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit
import MediaPlayer

class MP_ViewController: UIViewController {

    var playUrl: URL!
    var moviePlayer: MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        //创建视频播放器
        playUrl = Bundle.main.url(forResource: "泡沫", withExtension: "mp4")
        moviePlayer = MPMoviePlayerController(contentURL: playUrl)
        moviePlayer.view.frame = self.view.bounds
        self.view.addSubview(moviePlayer.view)
        
        //屏幕旋转监听
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChange), name: Notification.Name.UIApplicationDidChangeStatusBarOrientation, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playbackStateChange(notice:)), name: Notification.Name.MPMoviePlayerPlaybackStateDidChange, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviePlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        moviePlayer = nil
    }

    func orientationChange() {
        moviePlayer.view.frame = self.view.bounds
    }
    
    func playbackStateChange(notice: Notification) {
        let obj = notice.object as! MPMoviePlayerController
        switch obj.playbackState {
        case .playing:
            print("playing")
            break
        case .paused:
            print("pause")
            break
        case .stopped:
            print("stop")
            break
        default:
            break
        }
    }
}
