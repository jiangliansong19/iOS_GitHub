//
//  MediaPlayer.swift
//  AdapterPattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit


@objc protocol MediaPlayer {
    @objc optional func play(audioType: String, fileName: String)
}


@objc protocol AdvancedMediaPlayer {
    @objc optional func playVlc(fileName: String)
    @objc optional func playMp4(fileName: String)
}


class VlcPlayer: AdvancedMediaPlayer {
    func playVlc(fileName: String) {
        print("Playing vlc file. Name: \(fileName).vlc")
    }
    
    func playMp4(fileName: String) {
        
    }
}

class Mp4Player: AdvancedMediaPlayer {
    func playVlc(fileName: String) {
        
    }
    func playMp4(fileName: String) {
        print("Playing mp4 file. Name: \(fileName).mp4")
    }
}



class MediaAdapter: MediaPlayer {
    
    func play(audioType: String, fileName: String) {
        if audioType.lowercased() == "mp4" {
            Mp4Player().playMp4(fileName: fileName)
        }else if audioType.lowercased() == "vlc" {
            VlcPlayer().playVlc(fileName: fileName)
        }
    }
}


