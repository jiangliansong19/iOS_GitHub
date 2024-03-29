//
//  ViewController.swift
//  AdapterPattern
//
//  Created by JLS on 2017/2/18.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

/*
 
 适配器模式（Adapter Pattern）是作为两个不兼容的接口之间的桥梁。
 这种类型的设计模式属于结构型模式，它结合了两个独立接口的功能。
 这种模式涉及到一个单一的类，该类负责加入独立的或不兼容的接口功能。如例子中的MediaAdapter
 
*/


/*
 
 适配器模式：在中国，每个手机，都有一个220v变压的充电器，一切如此美好。
 有一天，他要去美国出差，那么的充电便不能使用了。怎么办？买一个变压插座，110V变成220V便正常了。
 手机，充电器，是两个对象，美国插座是一个对象，中国插座也是一个对象。为了适应两个作家，变压插座出现了，这是一个适配类。
 
*/

/*
 
 适配器模式，桥接模式的区别：
 适配器模式：已有两个接口，但是不兼容，适配器模式，可以使其兼容。目标是兼容。
 桥接模式：什么都还没有，使用桥接模式，使抽象和实现分离。目标是分离。
 
 
 桥接是先建桥，再规划发展两岸；
 适配是两岸已经发展的不错了，建一座桥，方便交通。
 
 */

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

