//
//  ViewController.swift
//  AdapterPattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let player = AudioPlayer()
        player.play(audioType: "mp3", fileName: "泡沫")
        player.play(audioType: "mp4", fileName: "功夫熊猫")
        player.play(audioType: "vlc", fileName: "时空旅客")
        player.play(audioType: "wma", fileName: "星际航行")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

