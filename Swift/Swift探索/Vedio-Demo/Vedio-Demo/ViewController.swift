//
//  ViewController.swift
//  Vedio-Demo
//
//  Created by 江连松 on 2017/5/25.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func MPMoviePlayerViewControllerAction(_ sender: UIButton) {
        
        let playUrl = Bundle.main.url(forResource: "一字马", withExtension: "mp4")
        let vc = MPMoviePlayerViewController(contentURL: playUrl)
        self.presentMoviePlayerViewControllerAnimated(vc)
    }
    
    @IBAction func AVPlayerViewControllerAction(_ sender: UIButton) {
        
        let playUrl = Bundle.main.url(forResource: "泡沫", withExtension: "mp4")
        let vc = AVPlayerViewController()
        vc.player = AVPlayer(url: playUrl!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

