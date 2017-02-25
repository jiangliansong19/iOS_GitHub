//
//  AudioPlayer.swift
//  AdapterPattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class AudioPlayer: MediaPlayer {
    
    func play(audioType: String, fileName: String) {
        
        //audioPlayer最基本的功能，播放mp3
        if audioType.lowercased() == "mp3" {
            print("Playing mp3 file. Name: \(fileName).mp3")
        }
        //播放mp4和Vlc
        else if audioType.lowercased() == "mp4" || audioType.lowercased() == "vlc" {
            MediaAdapter().play(audioType: audioType, fileName: fileName)
        }
        //不合格的格式
        else {
            print("Invalid media.\(audioType) format not supported")
        }
    }
}
