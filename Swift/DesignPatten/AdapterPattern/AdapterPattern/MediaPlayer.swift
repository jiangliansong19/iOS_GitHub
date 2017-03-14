//
//  MediaPlayer.swift
//  AdapterPattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

//视频播放器
protocol AdvancedMediaPlayer {
    func play(fileName: String)
}

class VlcPlayer: AdvancedMediaPlayer {
    func play(fileName: String) {
        print("Playing vlc file. Name: \(fileName).vlc")
    }
}

class Mp4Player: AdvancedMediaPlayer {
    func play(fileName: String) {
        print("Playing mp4 file. Name: \(fileName).mp4")
    }
}




//适配器。将多种视频播放器，适配到audioPlayer
class MediaAdapter: NSObject {
    
    func play(audioType: String, fileName: String) {
        if audioType.lowercased() == "mp4" {
            Mp4Player().play(fileName: fileName)
        }else if audioType.lowercased() == "vlc" {
            VlcPlayer().play(fileName: fileName)
        }
    }
}
