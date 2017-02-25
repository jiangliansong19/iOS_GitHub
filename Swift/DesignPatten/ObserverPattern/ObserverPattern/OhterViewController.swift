//
//  OhterViewController.swift
//  ObserverPattern
//
//  Created by JLS on 2017/2/17.
//  Copyright © 2017年 JLS. All rights reserved.
//

import UIKit

class OhterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sendNoticeAction(_ sender: UIButton) {
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: Notification_myNotice)))
    }

    
}
