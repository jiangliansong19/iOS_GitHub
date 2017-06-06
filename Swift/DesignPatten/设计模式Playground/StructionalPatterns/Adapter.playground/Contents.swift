//: Playground - noun: a place where people can play

import UIKit

protocol Player {
    func play(_ fileName: String)
}

class MediaPlayer {
    
    func play(fileName: String) {
        var suffix = fileName.components(separatedBy: ".").last ?? ""
        if fileName.contains(".") == false {
            suffix = ""
        }
        if suffix == "mp4" {
            print("使用\(String(describing:type(of: self)))播放\(fileName)")
        }else if suffix == "" {
            print("未知格式，无法播放此视频")
        }else {
            MediaAdapter().play(fileName: fileName.components(separatedBy: suffix).first!, suffix: suffix)
        }
    }
}

class MediaAdapter {
    
    func play(fileName: String, suffix: String) {
        if suffix.lowercased() == "mkv" {
            MKVPlayer().play(fileName)
        }else if suffix.lowercased() == "wma" {
            WMAPlayer().play(fileName)
        }else if suffix.lowercased() == "avi" {
            AVIPlayer().play(fileName)
        }
    }
}

class MKVPlayer: Player {
    func play(_ fileName: String) {
        print("使用\(String(describing:type(of: self)))播放\(fileName)mkv")
    }
}

class WMAPlayer: Player {
    func play(_ fileName: String) {
        print("使用\(String(describing:type(of: self)))播放\(fileName)wma")
    }
}

class AVIPlayer: Player {
    func play(_ fileName: String) {
        print("使用\(String(describing:type(of: self)))播放\(fileName)avi")
    }
}


let player = MediaPlayer()
player.play(fileName: "环太平洋.mkv")
player.play(fileName: "功夫瑜伽.avi")
player.play(fileName: "功夫熊猫.mp4")
player.play(fileName: "生化危机6.wma")
player.play(fileName: "人民的名义")
